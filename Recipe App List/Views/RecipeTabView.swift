//
//  RecipeTabView.swift
//  Recipe App List
//
//  Created by מנחם מרטינוב on 02/11/2021.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView {
            Text("Featured View")
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }

            RecipeView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("Featured")
                    }
                }
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
