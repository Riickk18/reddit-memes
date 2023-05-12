//
//  ToastView.swift
//  riickk18-reddit-memes
//
//  Created by Richard Pacheco on 5/12/23.
//

import SwiftUI

struct ToastView: View {
    var toastMessage: String?
    var action: () -> Void

    var body: some View {
        HStack {
            Text(toastMessage ?? "")
                .multilineTextAlignment(.center)
                .font(.body)
                .padding(EdgeInsets(top: 12, leading: 15, bottom: 10, trailing: 0))
                .foregroundColor(.white)
            Button {
                action()
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 10, alignment: .center)
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .background(Color.black.opacity(0.7))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .frame(maxWidth: UIScreen.main.bounds.width - 40)
        .padding(.bottom, 20)
    }
}

#if DEBUG
struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView(toastMessage: "Mensaje", action: {})
    }
}
#endif
