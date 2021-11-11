//
//  RecipeModel.swift
//  Recipe App List
//
//  Created by מנחם מרטינוב on 30/10/2021.
//

import Foundation

class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()

    init() {
        recipes = DataService.getLocalData()
    }

    static func getPortion(_ ingredient: Ingredient, _ recpieServings: Int, _ targetServings: Int) -> String {
        return String(targetServings)
    }
}
