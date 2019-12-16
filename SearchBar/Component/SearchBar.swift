//
//  SearchBar.swift
//  SearchBar
//
//  Created by Mikiya Abe on 2019/12/16.
//  Copyright © 2019 Mikiya Abe. All rights reserved.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var searchTerm: String
    @State private var isEditing: Bool = false
    var placeholder: String?
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass").foregroundColor(.secondary)
                
                TextField(self.placeholder ?? "", text: $searchTerm, onEditingChanged: { isChanged in
                    self.isEditing = isChanged
                }, onCommit: {
                    print("onCommit")
                })
            }
            .frame(height: 32)
            .background(Color.init(.systemGray6))
            .cornerRadius(5)
            
            if isEditing {
                Button("Cancel") {
                    self.clearSearchResults()
                    UIApplication.shared.endEditing()
                }
            }
        }
    }
}

extension SearchBar {
    private func clearSearchResults() {
        self.searchTerm = ""
    }
}
