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
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominartor = ingredient.denom ?? 1
        var wholePortions = 0

        if ingredient.num != nil {
            //  Get a single serving size by multiplying denominator by the recipe servings
            denominartor *= recpieServings

            //  Get target portion by multiplying numerator by target servings
            numerator *= targetServings

            // Reduce fraction by greatest common divisor
            let divisor = Rational.greatestCommonDivisor(numerator, denominartor)
            numerator /= divisor
            denominartor /= divisor

            // Get the whole portion if numerator > denominator
            if numerator >= denominartor {
                // Calculated whole portions
                wholePortions = numerator / denominartor

                // Calculate the remainder
                numerator = numerator % denominartor

                // Assign to portion string
                portion += String(wholePortions)
            }

            // Express the remainder as a fraction
            if numerator > 0 {
                // Assign remaindern asnfraction to the protion string
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominartor)"
            }

            if var unit = ingredient.unit {
                if wholePortions > 1 {
                    if unit.suffix(2) == "ch" {
                        unit += "es"
                    } else if unit.suffix(1) == "f" {
                        unit = String(unit.dropLast())
                        unit += "ves"
                    } else {
                        unit += "s"
                    }
                }
                // Calculate appropriate suffix
                portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
                return portion + unit
            }
        }

        return portion
    }
}
