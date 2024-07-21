//
//  MealDetails.swift
//  DessertRecipesByAbby
//
//  Created by Yao Liu on 7/21/24.
//

import Foundation

struct MealDetail: Codable {
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    let ingredients: [String]

    enum CodingKeys: String, CodingKey {
        case idMeal, strMeal, strInstructions
    }

    struct DynamicCodingKeys: CodingKey {
        var stringValue: String
        init?(stringValue: String) { self.stringValue = stringValue }
        var intValue: Int?
        init?(intValue: Int) { return nil }
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DynamicCodingKeys.self)
        idMeal = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue: "idMeal")!)
        strMeal = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue: "strMeal")!)
        strInstructions = try container.decode(String.self, forKey: DynamicCodingKeys(stringValue: "strInstructions")!)
        
        var ingredientsArray: [String] = []
        for index in 1...20 {
            if let ingredient = try container.decodeIfPresent(String.self, forKey: DynamicCodingKeys(stringValue: "strIngredient\(index)")!), !ingredient.isEmpty,
               let measure = try container.decodeIfPresent(String.self, forKey: DynamicCodingKeys(stringValue: "strMeasure\(index)")!), !measure.isEmpty {
                ingredientsArray.append("\(ingredient): \(measure)")
            }
        }
        ingredients = ingredientsArray
    }
}

struct MealDetailResponse: Codable {
    let meals: [MealDetail]
}
