//
//  HomeViewModel.swift
//  FoodRecipe
//
//  Created by Abdullah Hafiz on 16/06/2025.
//

import SwiftUI

@MainActor
class HomeViewModel: ObservableObject {
    @Published var Recipes: [Recipe] = []
    @Published var isLoading: Bool = false
    
    private let APIKey = PlistReader.value(forKey: "Food2ForkKey")!
    var nextPageURL: String?
    
    
    
    func fetchRecpies(query: String? = nil) async {
        let url: URL
        
        if let q = query {
            nextPageURL = nil
            Recipes = []
            
            var urlcomp = URLComponents(string: "https://food2fork.ca/api/recipe/search/")
            urlcomp?.queryItems = [.init(name: "query", value: q)]
            guard let firstURL = urlcomp?.url else { return }
            url = firstURL
        } else if let next = nextPageURL{
            url = URL(string: next)!
        } else {
            return
        }
        
        guard !isLoading else { return }
        isLoading = true
        defer { isLoading = false }
        
        var resquest = URLRequest(url: url)
        resquest.setValue("Token \(APIKey)", forHTTPHeaderField: "Authorization")
        
        do {
            print("❎ URL :", url.absoluteString)
            let (data, response) = try await URLSession.shared.data(for: resquest)
            
            if let r = response as? HTTPURLResponse {
                print("Status:", r.statusCode)
            }
            
            
            let page = try JSONDecoder().decode(RecipePage.self, from: data)
            print("Descode Data Count:", page.count ?? 0, "Next Page URL:", page.next ?? "", "first row:", page.results?.first?.title ?? "")
            
            if query != nil {
                Recipes = page.results ?? []
            } else {
                Recipes += page.results ?? []
            }
            
            nextPageURL = page.next
        } catch {
            print("Error: ", error.localizedDescription)
        }
    }
    
    
}
