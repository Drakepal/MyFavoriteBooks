//
//  Library.swift
//  MyFavoriteBooks
//
//  Created by PM Student on 9/29/22.
//

import SwiftUI
import Combine

enum Section: CaseIterable {
    case myFavoriteBooks
    case finished
}


class Library: ObservableObject {
    var sortedBooks: [Section: [Book]] {
        get {
            let groupedBooks = Dictionary(grouping: booksCache, by: \.myFavoriteBooks)
            return Dictionary(uniqueKeysWithValues: groupedBooks.map {
                (($0.key ? .myFavoriteBooks : .finished), $0.value)
            })
        }
        set {
            booksCache =
            newValue
                .sorted { $1.key == .finished }
                .flatMap { $0.value }
        }
    }
    
    func sortBooks() {
        booksCache =
        sortedBooks
            .sorted { $1.key == .finished }
            .flatMap { $0.value }
        
        objectWillChange.send()
    }
    
    func addNewBook(_ book: Book, image: Image?) {
        booksCache.insert(book, at: 0)
        images[book] = image
    }
    
    func deleteBook(atOffSets offsets: IndexSet, section: Section) {
        let booksBeforeDeletion = booksCache
        
        
        sortedBooks[section]?.remove(atOffsets: offsets)
        
        for change in booksCache.difference(from: booksBeforeDeletion) {
            if case .remove(_, let deletedBook, _) = change {
                images[deletedBook] = nil
            }
        }
    }
    
    func moveBooks(oldOffSets: IndexSet, newOffSet: Int, section: Section) {
        sortedBooks[section]?.move(fromOffsets: oldOffSets, toOffset: newOffSet)
    }
    
    
    @Published private var booksCache: [Book] = [
        .init(title: "The Lightning Thief", author: "Rick Riordan", microReview: "Enthralling."),
        .init(title: "The Sea of Monsters", author: "Rick Riordan"),
        .init(title: "The Titan's Curse", author: "Rick Riordan"),
        .init(title: "The Battle of The Labyrinth", author: "Rick Riordan"),
        .init(title: "The Last Olympian", author: "Rick Riordan"),
        .init(title: "The Son of Neptune", author: "Rick Riordan"),
        .init(title: "The Mark of Athena", author: "Rick Riordan"),
        .init(title: "The House of Hades", author: "Rick Riordan"),
        .init(title: "The Blood of Olympus", author: "Rick Riordan", microReview: "Heart Wrenching."),
        .init(title: "Ready Player One", author: "Ernest Cline", microReview: "Fascinating.")
    ]
    
    @Published var images: [Book: Image] = [:]
    
}
