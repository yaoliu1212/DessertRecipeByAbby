//
//  Meal.swift
//  DessertRecipesByAbby
//
//  Created by Yao Liu on 7/21/24.
//

import Foundation

struct Meal: Identifiable, Codable {
    let idMeal: String
    let strMeal: String
    let strMealThumb: String?

    var id: String { idMeal }
}

struct MealResponse: Codable {
    let meals: [Meal]
}
