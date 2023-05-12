//
//  LoaderView.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/11/23.
//

import SwiftUI

struct CustomLoaderView: View {
    @State private var isLoading = true

    var body: some View {
        ZStack {
            // Add any background views or content here
            if isLoading {
                Color.black.opacity(0.1)
                    .edgesIgnoringSafeArea(.all)
                    .overlay(
                        VStack {
                            SpinnerView()
                                .frame(width: 50, height: 50)
                                .foregroundColor(Color(uiColor: Asset.Colors.searchbarRoundColor.color))
                        }
                    )
            }
        }
        .onAppear {
            isLoading = true
        }
    }
}

struct SpinnerView: View {
    @State private var isAnimating = false

    var body: some View {
        Circle()
            .trim(from: 0, to: 0.8)
            .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, lineJoin: .round))
            .rotationEffect(Angle(degrees: isAnimating ? 360 : 0))
            .animation(Animation.linear(duration: 0.8).repeatForever(autoreverses: false),
                       value: isAnimating
            )
            .onAppear {
                isAnimating = true
            }
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        CustomLoaderView()
    }
}
