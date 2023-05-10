//
//  GradientBackgroundView.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/10/23.
//

import SwiftUI

struct GradientBackgroundView: View {
    var colors: (UIColor, UIColor)
    var points: (startPoint: UnitPoint, endPoint: UnitPoint)
    
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(uiColor: colors.0),
                Color(uiColor: colors.1)
            ]),
            startPoint: points.startPoint,
            endPoint: points.endPoint)
    }
}

struct GradientBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        GradientBackgroundView(
            colors: (
                Asset.Colors.buttonGradient1.color,
                Asset.Colors.buttonGradient2.color
            ),
            points: (
                startPoint: .leading,
                endPoint: .trailing
            )
        )
    }
}
