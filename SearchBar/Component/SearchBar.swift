//
//  SearchBar.swift
//  SearchBar
//
//  Created by Mikiya Abe on 2019/12/16.
//  Copyright © 2019 Mikiya Abe. All rights reserved.
//

import Combine
import SwiftUI

/// A searchBar with a textField which is the first responder
struct SearchBar: View {
    @State private var showCancelButton: Bool = false

    @Binding var text: String
    let placeholder: String?
    var onTap: (() -> Void)?
    var onEdit: (() -> Void)?
    var onCommit: ((String) -> Void)?
    var onCancel: (() -> Void)?

    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")

                UITextFieldView(text: $text, placeholder: placeholder, onTap: {
                    self.onTap?()
                }, onEdit: { isChanged in
                    self.showCancelButton = isChanged
                    self.onEdit?()
                }, onCommit: { textFieldText in
                    self.text = textFieldText
                    self.onCommit?(textFieldText)
                }).foregroundColor(.primary)
            }
            .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
            .foregroundColor(.secondary)
            .background(Color(.secondarySystemBackground))
            .cornerRadius(10.0)
            .padding(.vertical, 10)

            if showCancelButton {
                Button("Cancel") {
                    self.onTapCancelButton()
                }
            }
        }
        .padding(.horizontal)
    }
}

extension SearchBar {
    private func onTapCancelButton() {
        self.onCancel?()
        self.text.clear()
        self.showCancelButton = false
    }
}
