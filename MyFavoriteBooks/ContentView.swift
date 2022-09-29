//
//  ContentView.swift
//  MyFavoriteBooks
//
//  Created by PM Student on 9/28/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            Book.Image()
            Text("Title")
                .font(.title2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


