//
//  SwiftUISearchBar.swift
//  SwiftUISearchBar
//
//  Created by Mikiya Abe on 2020/1/3.
//  Copyright © 2019 Mikiya Abe. All rights reserved.
//

import Combine
import SwiftUI

/// A searchBar with a textField which is the first responder
public struct SwiftUISearchBar: View {
    @State private var showCancelButton: Bool = false

    @Binding public var text: String
    public let placeholder: String
    public var onTap: (() -> Void)?
    public var onEdit: (() -> Void)?
    public var onCommit: ((String) -> Void)?
    public var onCancel: (() -> Void)?
    
    public init(text: Binding<String>, placeholder: String = "",
                onTap: (() -> Void)? = nil,
                onEdit: (() -> Void)? = nil,
                onCommit: ((String) -> Void)? = nil,
                onCancel: (() -> Void)? = nil
                ) {
        self._text = text
        self.placeholder = placeholder
        self.onTap = onTap
        self.onEdit = onEdit
        self.onCommit = onCommit
        self.onCancel = onCancel
    }

    public var body: some View {
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
            .padding(.init(top: 8, leading: 6, bottom: 8, trailing: 6))
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

    private func onTapCancelButton() {
        self.onCancel?()
        self.text = ""
        self.showCancelButton = false
        self.hideKeyboard()
    }
}
