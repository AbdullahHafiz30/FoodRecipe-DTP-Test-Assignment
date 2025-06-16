//
//  RecipeCardView.swift
//  FoodRecipe
//
//  Created by Abdullah Hafiz on 16/06/2025.
//

import SwiftUI

struct RecipeCardView: View {
    
    var recipe: Recipe
    
    var body: some View {
        ZStack {
            VStack {
                AsyncImage(url: URL(string: recipe.featured_image ?? "")!) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                        .frame(width: 150, height: 150)
                        .background(Color.gray.opacity(0.2))
                }
                .frame(width: 150, height: 150)
                .clipShape(.rect(cornerRadius: 15))
                .padding(.bottom)
                
                Text(recipe.title ?? "")
                    .font(.system(size: 18, weight: .bold))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(recipe.publisher ?? "")
                    .font(.title2)
                    .opacity(0.4)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            }
            .frame(width: 140, height: 230)
            .padding()
        }
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .strokeBorder(.gray.opacity(0.1), lineWidth: 2)
        )
    }
}

struct RecipeCardView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCardView(recipe: Recipe(pk: 1,title: "Cauldron&nbsp;Cakes - Home - Pastry Affair",publisher: "blake",featured_image: "https://nyc3.digitaloceanspaces.com/food2fork/food2fork-static/featured_images/1/featured_image.png",rating: 22,source_url: "http://www.thepastryaffair.com/blog/2011/7/12/cauldron-cakes.html",description: "N/A",cooking_instructions: nil,ingredients: ["12","cupcakes","devil's food","Chocolate Glaze","Edible gold glitter","4 tablespoons butter","1 recipe for Chocolate Glaze (below)","Approximately 1/2 cup chocolate chips","1 recipe for Marshmallow Filling (below)","6 ounces (1 cup) semi-sweet chocolate chips"],date_added: "November 11 2020",date_updated: "November 11 2020",long_date_added: 1606348709,long_date_updated: 1606348709))
    }
}
