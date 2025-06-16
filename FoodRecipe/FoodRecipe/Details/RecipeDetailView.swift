//
//  RecipeDetailView.swift
//  FoodRecipe
//
//  Created by Abdullah Hafiz on 16/06/2025.
//

import SwiftUI

struct RecipeDetailView: View {
    
    @Environment(\.dismiss) private var dismiss
    @StateObject var vm = DetailsViewModel()
    var id: Int
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 8) {
                    AsyncImage(url: URL(string: vm.recipe?.featured_image ?? "")) { image in
                        image.resizable()
                            .frame(width: 350, height: 350)
                            .cornerRadius(15)
                    } placeholder: {
                        ProgressView()
                            .frame(width: 350, height: 350)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(15)
                    }
                    
                    Text(vm.recipe?.title ?? "")
                        .font(.system(size: 26 , weight: .bold))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.init(top: 10, leading: 25, bottom: 0, trailing: 10))
                    
                    Text("Published by: \(vm.recipe?.publisher ?? "")")
                        .font(.system(size: 16 , weight: .light))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.init(top: 5, leading: 25, bottom: 0, trailing: 10))
                    
                    ingredients(recipe: vm.recipe)
                    
                }
            }
            .task { await vm.fetchRecipe(id: id) }
            .refreshable { await vm.fetchRecipe(id: id) }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                    }) {
                        Image(systemName: "heart")
                            .resizable()
                            .foregroundColor(.primary)
                            .frame(width: 25, height: 25)
                    }
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .foregroundColor(.primary)
                            .frame(width: 25, height: 25)
                    }
                }
                
                ToolbarItem(placement: .principal) {
                    Text("Meals Recipes")
                        .font(.system(size: 28, weight: .bold))
                }
            }
            
            
        }.navigationBarBackButtonHidden(true)
    }
}

struct ingredients: View {
    
    let recipe: Recipe?
    
    var body: some View {
        VStack {
            if let urlString = recipe?.source_url {
                let url = URL(string: urlString)!
                Text("")
                Link("Source Link" , destination: url)
                    .font(.system(size: 16 , weight: .light))
                    .foregroundColor(.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.init(top: 5, leading: 25, bottom: 0, trailing: 10))
            }
            
            Text("Ingredients")
                .font(.system(size: 20 , weight: .bold))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.init(top: 10, leading: 25, bottom: 2, trailing: 0))
            
            ForEach(recipe?.ingredients ?? [], id: \.self) { ingredient in
                Text("- \(ingredient)")
                    .font(.system(size: 16 , weight: .light))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.init(top: 1, leading: 25, bottom: 0, trailing: 0))
            }
        }
    }
}


struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView(id: 6)
    }
}
