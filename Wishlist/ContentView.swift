//
//  ContentView.swift
//  Wishlist
//
//  Created by Ayanesh Sarkar on 30/12/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
  @Environment(\.modelContext) private var modelContext
  @Query private var wishes: [Wish]
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(wishes) { wish in
          Text(wish.title)
            .font(.title.weight(.light))
            .padding(.vertical, 2)
        }
      } // List
      .navigationTitle("Wishlist")
      .overlay {
        if wishes.isEmpty {
          ContentUnavailableView(
            "My Wishlist",
            systemImage: "heart.circle",
            description: Text(
              "No wishes yet. Add one to get started."
            )
          )
        }
      }
    } // NavigationStack
  }
}
