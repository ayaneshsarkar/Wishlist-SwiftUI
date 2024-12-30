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
  @State private var isAlertShowing: Bool = false
  @State private var title: String = ""
  
  var body: some View {
    NavigationStack {
      List {
        ForEach(wishes) { wish in
          Text(wish.title)
            .font(.title.weight(.light))
            .padding(.vertical, 2)
            .swipeActions {
              Button("Delete", role: .destructive) {
                modelContext.delete(wish)
              }
            }
        }
      } // List
      .navigationTitle("Wishlist")
      .toolbar {
        ToolbarItem(placement: .topBarTrailing) {
          Button {
            isAlertShowing.toggle()
          } label: {
            Image(systemName: "plus")
              .imageScale(.large)
          }
        }
        
        if wishes.isEmpty != true {
          ToolbarItem(placement: .bottomBar) {
            Text("\(wishes.count) wish\(wishes.count > 1 ? "es" : "")")
          }
        }
      }
      .alert("Create a new wish", isPresented: $isAlertShowing) {
        TextField("Enter a wish", text: $title)
        
        Button {
          modelContext.insert(Wish(title: title))
          title = ""
        } label: {
          Text("Save")
        }
      }
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
