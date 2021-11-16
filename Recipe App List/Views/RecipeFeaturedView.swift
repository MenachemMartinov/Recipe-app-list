//
//  RecipeFeaturedView.swift
//  Recipe App List
//
//  Created by מנחם מרטינוב on 03/11/2021.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model: RecipeModel
    @State var isDetailViewShowing = false
    @State var tabColectionIndex = 0
    var body: some View {
        VStack(alignment: .leading) {
            // MARK: Head title

            Text("Featured Recupes")
                .font(Font.custom("Avenir Heavy", size: 24))
                .padding(.leading)
                .padding(.top)

            // MARK: Geometry reader and card view

            GeometryReader { geo in

                // MARK: Tab view

                TabView(selection: $tabColectionIndex) {
                    // MARK: For each

                    ForEach(0 ..< model.recipes.count) { i in

                        // MARK: recipe

                        let recipe = model.recipes[i]

                        // MARK: Check featured

                        if recipe.featured {
                            // MARK: View

                            Button(action: {
                                self.isDetailViewShowing = true
                            }, label: {
                                // MARK: ZStack

                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)

                                    VStack {
                                        Image(recipe.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()

                                        Text(recipe.name)
                                            .padding(5)
                                            .font(Font.custom("Avenir", size: 15))
                                    }
                                }
                            })
                                .tag(i)
                                .sheet(isPresented: $isDetailViewShowing) {
                                    RecipeDetatilView(recipe: model.recipes[i])
                                }
                                .buttonStyle(PlainButtonStyle())
                                .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                                .cornerRadius(15)
                                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        }
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            }

            // MARK: VStack

            VStack(alignment: .leading, spacing: 10) {
                let theRecipe: Recipe = model.recipes[tabColectionIndex]
                Text("Prepartion Time:")
                    .font(Font.custom("Avenir Heavy", size: 16))
                Text(theRecipe.prepTime)

                Text("Highlights")
                    .font(Font.custom("Avenir Heavy", size: 16))
                RecipeHighlights(highlights: theRecipe.highlights)
            }
            .padding([.leading, .bottom])
        }
        .onAppear(perform: {
            setFeaturedIndex()
        })
    }

    func setFeaturedIndex() {
        let index = model.recipes.firstIndex { (recipe) -> Bool
            in
            recipe.featured
        }
        tabColectionIndex = index ?? 0
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
