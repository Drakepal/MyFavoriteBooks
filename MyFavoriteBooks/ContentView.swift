//
//  ContentView.swift
//  MyFavoriteBooks
//
//  Created by PM Student on 9/28/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List(Library().sortedBooks, id: \.title) { book in
                BookRow(book: book)
            }
            .navigationTitle("My Favorite Books")
        }
    }
}

struct BookRow: View {
    let book: Book
    
    var body: some View {
        NavigationLink(
            destination: DetailView(book: book)) {
                HStack {
                    Book.Image(title: book.title)
                    TitleAndAuthorStack(book: book)
                        .lineLimit(1)
                }
        }
        .padding(.vertical)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

