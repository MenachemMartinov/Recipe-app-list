//
//  recipeDetatilView.swift
//  Recipe App List
//
//  Created by מנחם מרטינוב on 31/10/2021.
//

import SwiftUI

struct RecipeDetatilView: View {
    var recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MARK: Recipe Image

                Image(recipe.image)
                    .resizable()
                    .scaledToFill()

                // MARK: Ingredients

                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(.headline)
                        .padding([.bottom, .top], 5)

                    ForEach(recipe.ingredients) { i in
                        Text("• " + i.name)
                            .padding(.bottom, 1)
                    }
                }
                .padding(.horizontal)

                // MARK: Divider

                Divider()

                // MARK: Directions

                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(.headline)
                        .padding([.bottom, .top], 5)

                    ForEach(0 ..< recipe.directions.count, id: \.self) { i in
                        Text(String(i + 1) + ". " + recipe.directions[i])
                            .padding(.bottom, 5)
                    }
                }
                .padding(.horizontal)

                // MARK: Divider

                Divider()
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct recipeDetatilView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetatilView(recipe: model.recipes[0])
    }
}
