//
//  recipePage.swift
//  FoodRecipe
//
//  Created by Abdullah Hafiz on 15/06/2025.
//

import SwiftUI

struct RecipePage: Codable {
    var count: Int?
    var next: String?
    var previous: String?
    var results: [Recipe]?
}
