//
//  DetailsViewModel.swift
//  FoodRecipe
//
//  Created by Abdullah Hafiz on 16/06/2025.
//

import SwiftUI

class DetailsViewModel: ObservableObject {
    @Published var recipe: Recipe?
    private let APIKey = PlistReader.value(forKey: "Food2ForkKey")!
    
    func fetchRecipe(id: Int) async {
        var urlcomp = URLComponents(string: "https://food2fork.ca/api/recipe/get/?")
        urlcomp?.queryItems = [URLQueryItem(name: "id", value: String(id))]
        
        guard let url = urlcomp?.url else { return }
        
        var request = URLRequest(url: url)
        request.setValue("Token \(APIKey)", forHTTPHeaderField: "Authorization")
        
        do {
            print("❎ URL : ", url.absoluteString)
            let (data, response) = try await URLSession.shared.data(for: request)
            
            if let response = response as? HTTPURLResponse, response.statusCode != 200 {
                print("❌ Status Code : ", response.statusCode)
                return
            }
            
            let dec = try JSONDecoder().decode(Recipe.self, from: data)
            await MainActor.run {              // 🏠 hop to main thread
                self.recipe = dec
            }
        } catch {
            print("Error: ", error.localizedDescription)
        }
        
    }
}
