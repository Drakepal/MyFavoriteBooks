//
//  ReviewAndImageStackView.swift
//  MyFavoriteBooks
//
//  Created by PM Student on 10/5/22.
//

import SwiftUI
import class PhotosUI.PHPickerViewController

struct ReviewAndImageStack: View {
    @State var showImagePicker = false
    @State var showingDialogue = false
    @ObservedObject var book: Book
    @Binding var image: Image?
    var body: some View {
        
        VStack {
            Divider()
                .padding(.vertical)
            TextField("Review...", text: $book.microReview)
            Divider()
                .padding(.vertical)
            Book.Image(image: image, title: book.title, cornerRadius: 16)
                .scaledToFit()
           
            HStack {
               
                Spacer()
                    Button("Update Image"){
                        showImagePicker = true
                    
                }
                Spacer()
                if image != nil {
                    Button("Delete Image"){
                        showingDialogue = true
                       
                    }
                    Spacer()
                }
                
            }
            .padding()
            Spacer()
        }
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

struct ReviewAndImageStackView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewAndImageStack(book: .init(), image: .constant(nil))
            .padding(.horizontal)
    }
}
