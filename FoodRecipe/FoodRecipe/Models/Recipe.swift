//
//  Recipe.swift
//  FoodRecipe
//
//  Created by Abdullah Hafiz on 15/06/2025.
//

import SwiftUI

struct Recipe: Codable, Hashable, Identifiable {
    var pk: Int?
    var title: String?
    var publisher: String?
    var featured_image: String?
    var rating: Int?
    var source_url: String?
    var description: String?
    var cooking_instructions: String?
    var ingredients: [String]?
    var date_added: String?
    var date_updated: String?
    var long_date_added: Int?
    var long_date_updated: Int?
    
    var id: Int { pk ?? 0 }
}
