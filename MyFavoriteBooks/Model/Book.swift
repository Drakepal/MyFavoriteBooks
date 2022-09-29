//
//  Book.swift
//  MyFavoriteBooks
//
//  Created by PM Student on 9/29/22.
//

import Foundation
import SwiftUI

struct Book {
    let title: String
    let author: String
    
    init (
        title: String = "Title",
        author: String = "Author") {
            self.title = title
            self.author = author
    }
}
