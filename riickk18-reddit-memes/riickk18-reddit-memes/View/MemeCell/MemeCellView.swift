//
//  MemeCellView.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/10/23.
//

import SwiftUI

struct MemeCellView: View, Hashable {
    var uuid = UUID()
    @State var liked: Bool = false

    @StateObject var viewModel: MemeCellViewModel

    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                RemoteImageView(url: viewModel.image)
                    .frame(height: 209)
                VStack {
                    Spacer()
                        .frame(height: 15)
                    HStack { // writer data
                        RemoteImageView(url: "https://picsum.photos/700/700"
                        )
                        .frame(width: 30, height: 30)
                        .cornerRadius(15)
                        Text(viewModel.ownerName ?? "")
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
                Text(viewModel.title ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.title2)
                Text(viewModel.description ?? "")
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .frame(maxWidth: .infinity)
            .foregroundColor(.black)
            .padding(.horizontal, 20)

            HStack {
                Button {
                    liked = true
                } label: {
                    HStack(spacing: 0) {
                        Image(Asset.Assets.likeIcon.name)
                            .frame(width: 36, height: 36)
                        Text("Like")
                    }
                    .foregroundColor(liked ? .accentColor : .gray)
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
                    ForEach((0..<viewModel.people.count), id: \.self) { index in
                        viewModel.people[index]
                        .frame(width: 30, height: 30)
                        .cornerRadius(15)
                        .zIndex(Double(viewModel.people.count - index))
                    }
                }
            }
            .padding(.horizontal, 20)

            Spacer()
                .frame(height: 17)
        }
        .background(.white)
        .cornerRadius(10)
        .shadow(
            color: Color.gray.opacity(0.7),
            radius: 8,
            x: 0,
            y: 0
         )
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
    }

    static func == (lhs: MemeCellView, rhs: MemeCellView) -> Bool {
        lhs.uuid == rhs.uuid
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}

struct MemeCellView_Previews: PreviewProvider {
    static var previews: some View {
        MemeCellView(viewModel: MemeCellViewModel(memeObject: MemeModel()))
    }
}
