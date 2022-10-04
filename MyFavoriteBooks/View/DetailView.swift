//
//  DetailView.swift
//  MyFavoriteBooks
//
//  Created by PM Student on 9/29/22.
//

import SwiftUI
import class PhotosUI.PHPickerViewController

struct DetailView: View {
    let book: Book
    @State var showImagePicker = false
    @Binding var image: Image?
    @State var showingDialogue = false
    
    
    var body: some View {
        VStack(alignment: .leading) {
            TitleAndAuthorStack(book: book, titleFont: .title, authorFont: .title2)
            VStack {
                Book.Image(image: image, title: book.title, cornerRadius: 16)
                    .scaledToFit()
                
                HStack {
                    Spacer()
                       Spacer()
                        Button("Update Image"){
                            showImagePicker = true
                        
                    }
                    Spacer()
                        if image != nil {
                            Button("Delete Image"){
                                showingDialogue = true
                            }
                        }
                    Spacer()
                }
                .padding()
            }
            Spacer()
        }
        .padding()
        .sheet(isPresented: $showImagePicker) {
            PHPickerViewController.View(image: $image)
        }
        .confirmationDialog(
            "Delete image for \(book.title)?",
            isPresented: $showingDialogue) {
                Button("Delete", role: .destructive) {
                    image = nil }
                
            } message: {
                Text("Delete image for \(book.title)?")
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(book: .init(), image: .constant(nil))
    }
}
