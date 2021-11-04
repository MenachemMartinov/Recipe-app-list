//
//  ContentView.swift
//  Recipe App List
//
//  Created by מנחם מרטינוב on 30/10/2021.
//

import SwiftUI

struct RecipeView: View {
    @EnvironmentObject var model: RecipeModel

    var body: some View {
        NavigationView {
            List(model.recipes) { r in

                NavigationLink(destination: RecipeDetatilView(recipe: r), label: {
                    // MARK: Row Item

                    HStack(spacing: 20.0) {
                        Image(r.image)
                            .resizable().scaledToFill().frame(width: 50, height: 50, alignment: .center).clipped()
                        Text(r.name)
                    }
                })
            }
            .navigationBarTitle("All Recipes")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
    }
}
