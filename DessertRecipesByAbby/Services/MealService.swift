//
//  apiData.swift
//  DessertRecipesByAbby
//
//  Created by Yao Liu on 7/20/24.
//

import Foundation

class MealService {
    private let baseURL = "https://themealdb.com/api/json/v1/1/"
    
    func fetchMeals() async throws -> [Meal] {
        let url = URL(string: "\(baseURL)filter.php?c=Dessert")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let mealResponse = try JSONDecoder().decode(MealResponse.self, from: data)
        return mealResponse.meals.sorted { $0.strMeal < $1.strMeal }
    }
    
    func fetchMealDetail(by id: String) async throws -> MealDetail {
        let url = URL(string: "\(baseURL)lookup.php?i=\(id)")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let mealDetailResponse = try JSONDecoder().decode(MealDetailResponse.self, from: data)
        return mealDetailResponse.meals.first!
    }
}
