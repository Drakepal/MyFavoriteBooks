//
//  BookView.swift
//  MyFavoriteBooks
//
//  Created by PM Student on 9/29/22.
//

import SwiftUI

extension Book {
    
    struct Image: View {
        
        let title: String
        
        var body: some View {
            let symbol = SwiftUI.Image(title: title)
            ??
                .init(systemName: "books.vertical")
            
            
            symbol
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.secondary.opacity(0.5))
        }
    }
}
extension Image {
    init?(title: String) {
        guard let character = title.first,
        case let symbolName = "\(character.lowercased()).square",
              UIImage(systemName: symbolName) != nil
        else {
            return nil
        }
       
        self.init(systemName: symbolName)
    }
}


struct Book_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Book.Image(title: Book().title)
            Book.Image(title: "")
            Book.Image(title: "📖")
        }
    }
}
