//
//  SearchView.swift
//  SearchBar
//
//  Created by Mikiya Abe on 2019/12/16.
//  Copyright © 2019 Mikiya Abe. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @State var searchTerm: String = ""
        
    var body: some View {
        VStack {
            SearchBar(searchTerm: $searchTerm, placeholder: "本を検索")
                .padding(.top)
            Spacer()
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
