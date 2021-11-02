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
}
