//
//  DetailView.swift
//  MyFavoriteBooks
//
//  Created by PM Student on 9/29/22.
//

import SwiftUI

struct DetailView: View {
    let book: Book
    
    
    
    var body: some View {
        VStack {
            TitleAndAuthorStack(book: book)
            Book.Image(title: book.title)
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init())
    }
}
