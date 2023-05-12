//
//  RemoteImageView.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/10/23.
//

import SwiftUI
import NukeUI

struct RemoteImageView: View {
    var url: String?
    var width: CGFloat?
    var height: CGFloat?
    var resizingMode: ImageResizingMode?
    var imageAlignment: Alignment = .center

    public var body: some View {
        LazyImage(source: url) { state in
            if let image = state.image {
                image
                    .resizingMode(resizingMode ?? .aspectFill)
            } else {
                Image("placeholder-release-artwork")
                    .styleFrameModifier(
                        width: width ?? .infinity,
                        height: height ?? .infinity,
                        mode: .fill,
                        template: .original
                    )
            }
        }
        .onDisappear(.cancel)
        .priority(.normal)
        .transition(.scale)
        .frame(maxWidth: width, maxHeight: height, alignment: imageAlignment)
    }
}

struct RemoteImageView_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImageView()
    }
}
