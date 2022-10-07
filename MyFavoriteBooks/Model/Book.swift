//
//  Book.swift
//  MyFavoriteBooks
//
//  Created by PM Student on 9/29/22.
//

import Foundation
import Combine

class Book: ObservableObject {
    @Published var title: String
    @Published var author: String
    @Published var microReview: String
    @Published var myFavoriteBooks: Bool
    
    
    init (
        title: String = "Title",
        author: String = "Author",
        microReview: String = "",
        myFavoriteBooks: Bool = true) {
            self.title = title
            self.author = author
            self.microReview = microReview
            self.myFavoriteBooks = myFavoriteBooks
    }
}

extension Book: Equatable {
    static func == (lhs: Book, rhs: Book) -> Bool {
        lhs === rhs
    }
}


extension Book: Hashable, Identifiable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
