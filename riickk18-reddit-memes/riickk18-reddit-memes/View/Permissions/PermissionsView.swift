//
//  PermissionsView.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/10/23.
//

import SwiftUI

struct PermissionsView: View {
    @StateObject var viewModel: PermissionsViewModel

    var body: some View {
        VStack {
            Image(viewModel.image)
                .padding(.bottom, 48)
            
            VStack(spacing: 20) {
                Text(viewModel.title)
                    .font(.title)
                
                Text(viewModel.subTitle)
                    .multilineTextAlignment(.center)
                    .font(.body)
            }
            .padding(.horizontal, 64)
            .padding(.bottom, 30)
            
            VStack(spacing: 20) {
                Button {
                    viewModel.principalButtonAction()
                } label: {
                    Text("Allow")
                        .frame(width: 185, height: 50)
                        .foregroundColor(.white)
                        .background {
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(uiColor: Asset.Colors.buttonGradient1.color),
                                    Color(uiColor: Asset.Colors.buttonGradient2.color)
                                ]),
                                startPoint: .leading,
                                endPoint: .trailing)
                            .cornerRadius(30)
                        }
                }
                
                Button {
                    print("Enable")
                } label: {
                    Text("Cancel")
                        .frame(width: 185, height: 50)
                        .foregroundColor(Color(uiColor: Asset.Colors.cancelButton.color))
                }
            }
        }
    }
}

struct PermissionsView_Previews: PreviewProvider {
    static var previews: some View {
        PermissionsView(viewModel: PermissionsViewModel())
    }
}
