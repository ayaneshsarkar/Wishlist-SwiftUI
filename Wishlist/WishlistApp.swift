//
//  WishlistApp.swift
//  Wishlist
//
//  Created by Ayanesh Sarkar on 30/12/24.
//

import SwiftUI
import SwiftData

@main
struct WishlistApp: App {
  var body: some Scene {
    WindowGroup {
      ContentView()
        .modelContainer(for: Wish.self)
    }
  }
}
