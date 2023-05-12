//
//  Image+Modifiers.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/10/23.
//

import SwiftUI

extension Image {
    func styleFrameModifier(
        width: CGFloat,
        height: CGFloat,
        mode: ContentMode,
        template: Image.TemplateRenderingMode
    ) -> some View {
        self
            .renderingMode(template)
            .resizable()
            .aspectRatio(contentMode: mode)
            .frame(maxWidth: width, maxHeight: height)
    }
}
