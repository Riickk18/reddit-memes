//
//  LaunchScreen.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/9/23.
//

import SwiftUI

struct LaunchScreen: View {
    var body: some View {
        ZStack {
            Image(Asset.Assets.launchBackground.name)
                .resizable(resizingMode: .tile)
                .ignoresSafeArea()

            Image(Asset.Assets.redditIcon.name)

            VStack {
                Spacer()

                VStack {
                    Image(Asset.Assets.launchscreen.name)
                    Text("Richard Pacheco")
                }
            }
        }
    }
}

struct LaunchScreen_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreen()
    }
}
