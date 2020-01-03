//
//  ContentView.swift
//  SearchBar
//
//  Created by Mikiya Abe on 2019/12/16.
//  Copyright © 2019 Mikiya Abe. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SearchView()) {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Tap me to search people!")
                    }
                    .accessibility(label: Text("Go to Search Page"))
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
