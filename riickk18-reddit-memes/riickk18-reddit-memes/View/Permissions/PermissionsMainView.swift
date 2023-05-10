//
//  PermissionsMainView.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/10/23.
//

import SwiftUI

struct PermissionsMainView: View {
    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            PermissionsView(viewModel: PermissionsViewModel())
//                .navigationDestination(for: HReleaseCell.self) { release in
//                    ReleaseView(path: $path, presenter: ReleasePresenter(interactor: ReleaseInteractor(), releaseId: release.presenter.releaseId))
//                        .toolbar(.hidden)
//                }
        }
    }
}

struct PermissionsMainView_Previews: PreviewProvider {
    static var previews: some View {
        PermissionsMainView()
    }
}
