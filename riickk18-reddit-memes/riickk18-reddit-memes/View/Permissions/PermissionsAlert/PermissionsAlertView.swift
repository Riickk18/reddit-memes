//
//  PermissionsAlertView.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/10/23.
//

import SwiftUI

struct PermissionsAlertView: View {
    @Binding var closeAction: Bool
    var padding: CGFloat = 15
    var body: some View {
        VStack {
            Spacer()

            HStack {
                Spacer()
                    .frame(width: padding)
                VStack(alignment: .center, spacing: 20) {

                    HStack {
                        Spacer()
                        Button {
                            closeAction = false
                        } label: {
                            Image(systemName: "x.circle.fill")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.trailing, -10)
                    .padding(.vertical, -10)

                    Text(Strings.Settings.Permissions.title)
                        .font(.title2)
                    Text(Strings.Settings.Permissions.subtitle)
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                    Spacer()
                        .frame(height: 5)
                    Button {
                        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!)
                    } label: {
                        Text(Strings.Settings.Permissions.primaryAction)
                            .frame(width: 185, height: 50)
                            .foregroundColor(.white)
                            .background(
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
                                .cornerRadius(25)
                            )
                    }

                }
                .padding(30)
                .background(.white)
                .cornerRadius(15)
                Spacer()
                    .frame(width: padding)
            }
            Spacer()
        }
        .ignoresSafeArea()
        .background {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
        }
    }
}

struct PermissionsAlertView_Previews: PreviewProvider {
    static var previews: some View {
        PermissionsAlertView(closeAction: .constant(true))
    }
}
