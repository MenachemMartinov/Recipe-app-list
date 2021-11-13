//
//  recipeDetatilView.swift
//  Recipe App List
//
//  Created by מנחם מרטינוב on 31/10/2021.
//

import SwiftUI

struct RecipeDetatilView: View {
    var recipe: Recipe
    @State var selectedServingSize = 2

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                // MARK: Recipe Image

                Image(recipe.image)
                    .resizable()
                    .scaledToFill()

                // MARK: Recipe title

                Text(recipe.name)
                    .bold()
                    .padding(.top, 20)
                    .padding(.leading)
                    .font(.largeTitle)

                // MARK: Serving Sise Picker

                VStack(alignment: .leading) {
                    Text("Select your serving size:  ")
                    Picker("", selection: $selectedServingSize) {
                        Text("2").tag(2)
                        Text("4").tag(4)
                        Text("6").tag(6)
                        Text("8").tag(8)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .frame(width: 160)
                }
                .padding()

                // MARK: Ingredient

                VStack(alignment: .leading) {
                    Text("Ingredient")
                        .font(.headline)
                        .padding([.bottom, .top], 5)

                    ForEach(recipe.ingredients) { i in
                        Text("• "
                            +
                            RecipeModel.getPortion(i, recipe.servings, selectedServingSize) + " " +
                            i.name.lowercased())
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
    }
}

struct recipeDetatilView_Previews: PreviewProvider {
    static var previews: some View {
        let model = RecipeModel()
        RecipeDetatilView(recipe: model.recipes[0])
    }
}
