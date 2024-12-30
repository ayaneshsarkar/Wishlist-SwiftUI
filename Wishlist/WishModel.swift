//
//  WishModel.swift
//  Wishlist
//
//  Created by Ayanesh Sarkar on 30/12/24.
//

import Foundation
import SwiftData

@Model
class Wish {
  init(title: String) {
    self.title = title
  }
  
  var title: String
}
