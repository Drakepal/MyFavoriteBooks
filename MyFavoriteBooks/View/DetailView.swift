//
//  DetailView.swift
//  MyFavoriteBooks
//
//  Created by PM Student on 9/29/22.
//

import SwiftUI
import class PhotosUI.PHPickerViewController

struct DetailView: View {
    @ObservedObject var book: Book

    @Binding var image: Image?
  
    
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(spacing: 16) {
                Button {
                    book.myFavoriteBooks.toggle()
                } label: {
                    Image(systemName: book.myFavoriteBooks ? "bookmark.fill" : "bookmark")
                        .font(.system(size: 48, weight: .light))
                }
                TitleAndAuthorStack(book: book, titleFont: .title, authorFont: .title2)
            }
            ReviewAndImageStack(book: book, image: $image)
            Spacer()
        }
        .padding()
       
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init(), image: .constant(nil))
    }
}


