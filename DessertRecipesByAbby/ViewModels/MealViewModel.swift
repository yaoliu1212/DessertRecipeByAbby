//
//  MealListViewModel.swift
//  DessertRecipesByAbby
//
//  Created by Yao Liu on 7/21/24.
//

import Foundation
@MainActor
class MealViewModel: ObservableObject {
    @Published var meals: [Meal] = []
    @Published var selectedMealDetail: MealDetail?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let mealService = MealService()

    func loadMeals() async {
        isLoading = true
        errorMessage = nil
        do {
            meals = try await mealService.fetchMeals()
        } catch {
            errorMessage = "Failed to load meals"
        }
        isLoading = false
    }

    func loadMealDetail(meal: Meal) async {
        isLoading = true
        errorMessage = nil
        do {
            selectedMealDetail = try await mealService.fetchMealDetail(by: meal.idMeal)
        } catch {
            errorMessage = "Failed to load meal detail"
        }
        isLoading = false
    }
}
