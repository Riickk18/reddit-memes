//
//  HomeViewModel.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/11/23.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @MainActor
    @Published var isLoading: Bool = false
    @Published var showNoResultsView = false
    @Published var searchText: String = ""
    var nextPageValue: String?
    var loadingNextPage: Bool = false
    @Published var elements: [MemeCellView] = [] {
        didSet {
            showNoResultsView = elements.count == 0
        }
    }

    enum DataTypeToFilter: String {
        case shitposting = "Shitposting"
        case image
    }

    private func updateElementsWithAnimation(newElements: [MemeCellView]) async {
        await MainActor.run {
            withAnimation {
                elements = newElements
                isLoading = false
            }
        }
    }

    private func showLoadingView() async {
        await MainActor.run {
            isLoading = true
        }
    }

    private func filterElements(elements: FetchMemeModel?) async -> [MemeCellView] {
        var arrayOfMemes = [MemeCellView]()
        elements?
            .data
            .children
            .filter {
                $0.data?.linkFlairText == DataTypeToFilter.shitposting.rawValue
            }
            .filter {
                $0.data?.postHint == DataTypeToFilter.image.rawValue
            }
            .forEach { memeModelObject in
                guard let memeObject = memeModelObject.data else {return}
                arrayOfMemes.append(MemeCellView(viewModel: MemeCellViewModel(memeObject: memeObject)))
            }
        return arrayOfMemes
    }

    func getInitialData(withoutLoading: Bool = false) async {
        do {
            if withoutLoading {
                await showLoadingView()
            }
            let memes = try await fetchInitialMemes()
            await updateElementsWithAnimation(newElements: memes)
        } catch {
            print(error.localizedDescription)
        }
    }

    func fetchInitialMemes() async throws -> [MemeCellView] {
        let networkHandler = NetworkHandler()
        let memeModelResponse = try await networkHandler.fetchMemes()
        self.nextPageValue = memeModelResponse?.data.after
        return await filterElements(elements: memeModelResponse)
    }

    func searchMemesBy(text: String) async {
        do {
            await showLoadingView()
            let memes = try await searchMemesWithQuery(text: text)
            await updateElementsWithAnimation(newElements: memes)
        } catch {
            print(error.localizedDescription)
        }
    }

    func searchMemesWithQuery(text: String) async throws -> [MemeCellView] {
        let networkHandler = NetworkHandler()
        let memeModelResponse = try await networkHandler.searchMemesBy(text: text)
        self.nextPageValue = memeModelResponse?.data.after
        return await filterElements(elements: memeModelResponse)
    }

    // MARK: - PAGINATION
    func loadMoreContent(currentItem item: MemeCellView) {
        let index = elements.firstIndex(where: { $0.uuid == item.uuid }) ?? 0
        if index >= elements.count - 2 && !loadingNextPage {
            loadingNextPage = true
            Task {
                await getNextPage()
            }
        }
    }

    func getNextPage() async {
        do {
            guard let page = nextPageValue else {return}
            let memes = try await fetchNextMemesPage(page: page)
            await MainActor.run {
                elements.append(contentsOf: memes)
            }
            loadingNextPage = false
        } catch {
            print(error.localizedDescription)
        }
    }

    func fetchNextMemesPage(page: String) async throws -> [MemeCellView] {
        let networkHandler = NetworkHandler()
        let memeModelResponse = try await networkHandler.fetchMemesByPage(page: page)
        self.nextPageValue = memeModelResponse?.data.after
        var arrayOfMemes = [MemeCellView]()
        memeModelResponse?.data.children.forEach({ memeModelObject in
            guard let memeObject = memeModelObject.data else {return}
            arrayOfMemes.append(MemeCellView(viewModel: MemeCellViewModel(memeObject: memeObject)))
        })
        return arrayOfMemes
    }
}
