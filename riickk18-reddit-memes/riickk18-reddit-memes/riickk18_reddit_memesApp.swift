//
//  riickk18_reddit_memesApp.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/9/23.
//
// swiftlint:disable type_name
import SwiftUI

@main
struct riickk18_reddit_memesApp: App {
    @AppStorage("permissionsWasCompleted", store: .standard) var permissionsWasCompleted: Bool = false

    var body: some Scene {
        WindowGroup {
            if permissionsWasCompleted {
                EmptyView()
            } else {
                PermissionsView(viewModel: PermissionsViewModel())
            }
        }
    }
}
// swiftlint:enable type_name
