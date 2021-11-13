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

    var body: some View {
        VStack(alignment: .leading) {
            // MARK: Head title

            Text("Featured Recupes")
                .bold()
                .font(.largeTitle)
                .padding(.leading)

            // MARK: Geometry reader and card view

            GeometryReader { geo in

                // MARK: Tab view

                TabView {
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
                                    }
                                }
                            })
                                .sheet(isPresented: $isDetailViewShowing) {
                                    RecipeDetatilView(recipe: model.recipes[i])
                                }
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
                Text("Prepartion Time:")
                    .font(.headline)
                Text("1 hour")

                Text("Highlights")
                    .font(.headline)
                Text("Healthy, Hearty")
            }
            .padding([.leading, .bottom])
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
