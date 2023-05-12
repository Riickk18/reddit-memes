//
//  SearchBarView.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/11/23.
//

import SwiftUI

struct SearchBarView: View {

    @Binding var searchText: String
    @FocusState private var isFocused: Bool
    let cancelComplementaryAction: (() -> Void)?
    @State var focusFromBeginning: Bool = false

    init(
        searchText: Binding<String>,
        focusFromBeginning: Bool = false,
        cancelComplementaryAction: (() -> Void)? = nil
    ) {
        self._searchText = searchText
        self.focusFromBeginning = focusFromBeginning
        self.cancelComplementaryAction = cancelComplementaryAction
    }

    var body: some View {
        HStack {
            Image(Asset.Assets.searchIcon.name)
                .resizable()
                .frame(width: 16, height: 16)

            ZStack(alignment: .leading) {
                TextField("", text: $searchText)
                    .foregroundColor(Color(uiColor: Asset.Colors.searchbarPlaceholder.color))
                    .font(.body)
                    .fontWeight(.regular)
                    .tracking(0.5)
                    .placeholder(when: searchText.isEmpty) {
                        Text("Search")
                            .foregroundColor(Color(uiColor: Asset.Colors.searchbarPlaceholder.color))
                            .fontWeight(.regular)
                    }
                    .focused($isFocused)
                    .disableAutocorrection(true)
                    .submitLabel(.done)
                    .keyboardType(.default)
            }

            if !searchText.isEmpty || isFocused {
                Button {
                    self.searchText = ""
                    self.isFocused = false
                    cancelComplementaryAction?()
                } label: {
                    Text("Cancel")
                        .font(.callout)
                        .foregroundColor(.black)
                }
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 12)
        .background(Color(uiColor: Asset.Colors.searchBackground.color))
        .cornerRadius(6)
        .overlay {
            RoundedRectangle(cornerRadius: 6)
                .stroke(
                    Color(uiColor: Asset.Colors.searchbarRoundColor.color).opacity(isFocused ? 1 : 0.5),
                    lineWidth: 1
                )
        }
        .onAppear {
            if focusFromBeginning {
                isFocused = true
            }
        }
    }
}

#if DEBUG
struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(searchText: .constant(""), cancelComplementaryAction: nil)
    }
}
#endif
