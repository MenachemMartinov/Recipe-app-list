//
//  RecipeHighlights.swift
//  Recipe App List
//
//  Created by מנחם מרטינוב on 14/11/2021.
//

import SwiftUI

struct RecipeHighlights: View {
    var allHighlights = ""

    init(highlights: [String]) {
        for i in 0 ..< highlights.count {
            if i == highlights.count - 1 {
                allHighlights += highlights[i]
            } else {
                allHighlights += highlights[i] + ", "
            }
        }
    }

    var body: some View {
        Text(allHighlights)
            .font(Font.custom("Avenir", size: 15))
    }
}

struct RecipeHighlights_Previews: PreviewProvider {
    static var previews: some View {
        RecipeHighlights(highlights: ["mmmm", "nnnnnnnn", "bbbbbbbbb"])
    }
}
