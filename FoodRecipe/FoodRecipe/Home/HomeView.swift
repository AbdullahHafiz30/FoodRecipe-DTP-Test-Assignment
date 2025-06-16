//
//  ContentView.swift
//  FoodRecipe
//
//  Created by Abdullah Hafiz on 15/06/2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject var vm = HomeViewModel()
    @State private var searchText = ""
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 130))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: adaptiveColumns, spacing: 20) {
                    ForEach(searchResults) { recipe in
                        NavigationLink(destination: RecipeDetailView(id: recipe.id), label: {
                            RecipeCardView(recipe: recipe).foregroundColor(.primary)
                        }).onAppear {
                            Task { await vm.fetchRecpies() }
                        }
                    }
                    
                    if vm.isLoading {
                        HStack { Spacer(); ProgressView(); Spacer() }
                    }
                }.padding()
                
            }
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                    }) {
                        Image("FilterIcon")
                            .resizable()
                            .frame(width: 25, height: 25)
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Text("Meals Recipes")
                        .font(.system(size: 28, weight: .bold))
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text: $searchText,
                        placement: .navigationBarDrawer(displayMode: .always),
                        prompt: "Search meal name")
            .task { await vm.fetchRecpies(query: "") }
            .refreshable { await vm.fetchRecpies() }
        }
        
        var searchResults: [Recipe] {
            if searchText.isEmpty {
                return vm.Recipes
            } else {
                return vm.Recipes.filter { $0.title?.lowercased().contains(searchText.lowercased()) ?? false }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
