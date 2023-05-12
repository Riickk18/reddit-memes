//
//  MainView.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/11/23.
//

import SwiftUI

struct MainView: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            HomeView(viewModel: HomeViewModel(), path: $path)
                .navigationDestination(for: MemeCellView.self, destination: { memeCell in
                    MemeDetailView(viewModel: memeCell.viewModel, path: $path)
                        .toolbar(.hidden)

                })
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
