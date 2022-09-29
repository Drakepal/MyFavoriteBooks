//
//  Library.swift
//  MyFavoriteBooks
//
//  Created by PM Student on 9/29/22.
//

struct Library {
    var sortedBooks: [Book] { booksCache }
    private var booksCache: [Book] = [
        .init(title: "The Lightning Thief", author: "Rick Riordan"),
        .init(title: "The Sea of Monsters", author: "Rick Riordan"),
        .init(title: "The Titan's Curse", author: "Rick Riordan"),
        .init(title: "The Battle of The Labyrinth", author: "Rick Riordan"),
        .init(title: "The Last Olympian", author: "Rick Riordan"),
        .init(title: "The Son of Neptune", author: "Rick Riordan"),
        .init(title: "The Mark of Athena", author: "Rick Riordan"),
        .init(title: "The House of Hades", author: "Rick Riordan"),
        .init(title: "The Blood of Olympus", author: "Rick Riordan"),
        .init(title: "Ready Player One", author: "Ernest Cline")
    ]
}
