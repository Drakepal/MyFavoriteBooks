//
//  BookView.swift
//  MyFavoriteBooks
//
//  Created by PM Student on 9/29/22.
//

import SwiftUI

extension Book {
    struct Image: View {
        var body: some View {
            SwiftUI.Image(systemName: "books.vertical")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.secondary.opacity(0.5))
        }
    }
    
}
