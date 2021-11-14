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
            VStack(alignment: .leading) {
                // MARK: Haed line

                Text("All Recipes")
                    .bold()
                    .font(.largeTitle)
                    .padding(.leading)

                // MARK: ScrollView

                ScrollView {
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes) { r in

                            NavigationLink(
                                destination: RecipeDetatilView(recipe: r),
                                label: {
                                    // MARK: Row Item

                                    HStack(spacing: 20.0) {
                                        Image(r.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50, alignment: .center)
                                            .clipped()
                                            .cornerRadius(10)
                                        VStack(alignment: .leading) {
                                            Text(r.name)
                                                .foregroundColor(.black)
                                                .bold()
                                            RecipeHighlights(highlights: r.highlights)
                                                .foregroundColor(.black)
                                        }
                                    }
                                })
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .padding(.leading)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeView()
            .environmentObject(RecipeModel())
    }
}
