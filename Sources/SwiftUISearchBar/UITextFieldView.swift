//
//  UITextFieldView.swift
//  SwiftUISearchBar
//
//  Created by Mikiya Abe on 2020/1/3.
//  Copyright © 2019 Mikiya Abe. All rights reserved.
//

import SwiftUI
import UIKit

struct UITextFieldView: UIViewRepresentable {
    typealias UIViewType = UITextField

    @Binding var text: String
    let placeholder: String?
    var onTap: (() -> Void)?
    var onEdit: ((Bool) -> Void)?
    var onCommit: ((String) -> Void)?

    func makeUIView(context: UIViewRepresentableContext<UITextFieldView>) -> UITextField {
        let textField: WrappableTextField = {
            let textField = WrappableTextField()
            textField.delegate = textField
            textField.returnKeyType = .search
            textField.placeholder = placeholder
            textField.clearButtonMode = .always
            textField.onTap = onTap
            textField.onEdit = onEdit
            textField.onCommit = onCommit
            return textField
        }()

        // 検索した後に、他の画面に遷移し、もう一度検索画面に戻ってきたときはキーボードを表示しない
        if $text.wrappedValue.isEmpty {
            textField.becomeFirstResponder()
        }
        return textField
    }

    func updateUIView(_ uiView: UITextField, context: UIViewRepresentableContext<UITextFieldView>) {
        uiView.text = $text.wrappedValue
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uiView.setContentHuggingPriority(.defaultLow, for: .horizontal)
    }
}

class WrappableTextField: UITextField, UITextFieldDelegate {
    var onTap: (() -> Void)?
    var onEdit: ((Bool) -> Void)?
    var onCommit: ((String) -> Void)?

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        onTap?()
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        onEdit?(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        onCommit?(textField.text ?? "")
    }
}
