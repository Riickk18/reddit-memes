//
//  HomeView.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/11/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    @FocusState private var isSearchBarFocused: Bool
    @State var showSettings: Bool = false
    @Binding var path: NavigationPath

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Button {
                self.showSettings = true
            } label: {
                Image(Asset.Assets.settingsIcon.name)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(uiColor: Asset.Colors.searchbarPlaceholder.color))
                    .background(
                        Rectangle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.clear)
                    )
            }
            .padding(.leading, 16)
            .padding(.bottom, 10)

            SearchBarView(
                searchText: $viewModel.searchText,
                cancelComplementaryAction: nil
            )
                .onChange(of: viewModel.searchText) { newValue in
                    searchAction(text: newValue)
                }
                .focused($isSearchBarFocused)
                .padding(.horizontal, 16)

            if viewModel.showNoResultsView {
                NoSearchResultsView()
            } else if viewModel.isLoading {
                CustomLoaderView()
            } else {
                ScrollView(.vertical, showsIndicators: true) {
                    LazyVStack {
                        Spacer()
                            .frame(height: 10)
                        ForEach(viewModel.elements, id: \.self) { element in
                            element
                                .onAppear {
                                    viewModel
                                        .loadMoreContent(currentItem: element)
                                }
                                .onTapGesture {
                                    path.append(element)
                                }
                        }
                    }
                }
                .refreshable {
                    await viewModel.getInitialData(withoutLoading: true)
                }
                .scrollDismissesKeyboard(.interactively)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .fullScreenCover(isPresented: $showSettings, content: {
            PermissionsView(viewModel: PermissionsViewModel()) {
                self.showSettings = false
            }
        })
        .task {
            guard viewModel.elements.count == 0 else {return}
            await viewModel.getInitialData()
        }
    }

    private func searchAction(text: String) {
        if text.isEmpty {
            Task {
                await viewModel.getInitialData()
            }
        } else {
            Task {
                await viewModel.searchMemesBy(text: text)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel(), path: .constant(NavigationPath()))
    }
}
