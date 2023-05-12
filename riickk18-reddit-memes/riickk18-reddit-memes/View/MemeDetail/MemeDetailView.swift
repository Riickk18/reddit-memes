//
//  MemeDetailView.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/11/23.
//

import SwiftUI

struct MemeDetailView: View {
    @StateObject var viewModel: MemeCellViewModel
    @Binding var path: NavigationPath

    var body: some View {
        VStack(alignment: .leading) {
            Button {
                path.removeLast()
            } label: {
                Image(Asset.Assets.backIcon.name)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(
                        Rectangle()
                            .frame(width: 36, height: 36)
                            .foregroundColor(.clear)
                    )
                    .frame(width: 20, height: 20)
            }

            Spacer()
                .frame(height: 76)
            
            Text(viewModel.title ?? "")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding(.bottom, 22)
            
            Text(viewModel.description ?? "")
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.white)
                .font(.body)
            
            HStack(spacing: 5) {
                ForEach((0..<viewModel.people.count), id: \.self) { index in
                    viewModel.people[index]
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                }
                Text("+\(viewModel.likeCounter ?? 0)")
                    .foregroundColor(Color(uiColor: Asset.Colors.searchbarPlaceholder.color))
                    .background(
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 40, height: 40)
                    )
                    .padding(.leading, 5)
            }
            
            
            Spacer()
            
            HStack(spacing: 28) {
                Button {
                    print("Like")
                } label: {
                    HStack(spacing: 5) {
                        Image(Asset.Assets.likeIcon.name)
                            .frame(width: 30, height: 30)
                        Text("\(viewModel.likeCounter ?? 0)")
                    }
                }
                
                Button {
                    print("Comment")
                } label: {
                    HStack(spacing: 5) {
                        Image(Asset.Assets.commentIcon.name)
                            .frame(width: 30, height: 30)
                        Text("\(viewModel.commentsCounter ?? 0)")
                    }
                }
            }
            .foregroundColor(.white)
            
            Spacer()
                .frame(height: 29)
            
        }
        .padding(.horizontal, 31)
        .background {
            ZStack {
                RemoteImageView(url: viewModel.image ?? "https://picsum.photos/700/700", resizingMode: .aspectFill)
                Color.black.opacity(0.3)
            }
            .ignoresSafeArea()
        }
    }
}

struct MemeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MemeDetailView(
            viewModel: MemeCellViewModel(memeObject: MemeModel()),
            path: .constant(NavigationPath())
        )
    }
}
