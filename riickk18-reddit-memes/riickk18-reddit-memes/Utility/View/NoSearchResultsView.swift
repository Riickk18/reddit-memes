//
//  NoSearchResultsView.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/11/23.
//

import SwiftUI

struct NoSearchResultsView: View {
    var body: some View {
        VStack(alignment: .center) {
            Spacer()
            Image(Asset.Assets.noSearchResults.name)
                .resizable()
                .frame(width: 300, height: 286)
                .aspectRatio(contentMode: .fit)
            Spacer()
                .frame(height: 70)
            Text("No search results")
                .padding(.bottom, 20)
                .font(.title)
            Text("Sorry, there are no results for this search. Please try another phrase")
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding(.horizontal, 33)
    }
}

struct NoSearchResultsView_Previews: PreviewProvider {
    static var previews: some View {
        NoSearchResultsView()
    }
}
