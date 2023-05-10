//
//  MemeCellView.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/10/23.
//

import SwiftUI

struct MemeCellView: View {
    @StateObject var viewModel: MemeCellViewModel

    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                RemoteImageView(url: "https://picsum.photos/600/600"
                )
                    .frame(height: 209)
                VStack {
                    Spacer()
                        .frame(height: 15)
                    HStack {
                        RemoteImageView(url: "https://picsum.photos/700/700"
                        )
                        .frame(width: 30, height: 30)
                        .cornerRadius(15)
                        Text("Jeremiah Bridges")
                            .foregroundColor(.white)
                        Spacer()
                    }
                    .padding(.horizontal, 20)
                    Spacer()
                        .frame(height: 15)
                }
                .background(
                    GradientBackgroundView(
                        colors: (
                            UIColor.black,
                            UIColor.black.withAlphaComponent(0)),
                            points: (startPoint: .bottom, endPoint: .top)
                    )
                )
            }
            
            Spacer()
                .frame(height: 17)
            
            VStack(alignment: .leading, spacing: 9) {
                Text("Writing A Good Headline For Your Advertisement")
                    .font(.title2)
                Text("These tips come from the safety experts at Voith Turbo, York, Pa., which manufactures a device that helps trains with braking, to make train travel even better. ")
            }
            .foregroundColor(.black)
            .padding(.horizontal, 20)

            HStack {
                Button {
                    print("Like")
                } label: {
                    HStack(spacing: 0) {
                        Image(Asset.Assets.likeIcon.name)
                            .frame(width: 36, height: 36)
                        Text("Like")
                    }
                    .foregroundColor(.gray)
                }
                Spacer()
                    .frame(width: 22)
                Button {
                    print("Comment")
                } label: {
                    HStack(spacing: 0) {
                        Image(Asset.Assets.commentIcon.name)
                            .frame(width: 36, height: 36)
                        Text("Comment")
                    }
                    .foregroundColor(.gray)
                }
                Spacer()
                HStack(spacing: -8) {
                    RemoteImageView(url: "https://picsum.photos/801/801"
                    )
                    .frame(width: 30, height: 30)
                    .cornerRadius(15)
                    .zIndex(3)
                    RemoteImageView(url: "https://picsum.photos/800/800"
                    )
                    .frame(width: 30, height: 30)
                    .cornerRadius(15)
                    .zIndex(2)
                    RemoteImageView(url: "https://picsum.photos/900/900"
                    )
                    .frame(width: 30, height: 30)
                    .cornerRadius(15)
                    .zIndex(1)
                }
            }
            .padding(.horizontal, 20)
            
            Spacer()
                .frame(height: 17)
        }
        .background(.white)
        .cornerRadius(10)
    }
}

struct MemeCellView_Previews: PreviewProvider {
    static var previews: some View {
        MemeCellView(viewModel: MemeCellViewModel())
    }
}
