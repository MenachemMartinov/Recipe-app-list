//
//  DataService.swift
//  Recipe App List
//
//  Created by מנחם מרטינוב on 30/10/2021.
//

import Foundation

class DataService {
    // get local adat
    static func getLocalData() -> [Recipe] {
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")

        guard pathString != nil else {
            return [Recipe]()
        }

        let url = URL(fileURLWithPath: pathString!)

        do {
            let data = try Data(contentsOf: url)

            let decoder = JSONDecoder()

            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)

                for r in recipeData {
                    r.id = UUID()

                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                return recipeData
            } catch {
                print("decoder error: \(error)")
            }

        } catch {
            print("data error: \(error)")
        }

        return [Recipe]()
    }
}
