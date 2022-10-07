//
//  MyFavoriteBooksApp.swift
//  MyFavoriteBooks
//
//  Created by PM Student on 9/28/22.
//

import SwiftUI

@main
struct MyFavoriteBooksApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(Library())
        }
    }
}
