//
//  DessertDetailView.swift
//  DessertRecipesByAbby
//
//  Created by Yao Liu on 7/21/24.
//

import SwiftUI

struct MealDetailView: View {
    let meal: Meal
    @ObservedObject var viewModel: MealViewModel

    var body: some View {
        VStack(alignment: .leading) {
            if let detail = viewModel.selectedMealDetail {
                Text(detail.strMeal)
                    .font(.largeTitle)
                    .padding()
                
                Text(detail.strInstructions)
                    .padding()
                
                Text("Ingredients:")
                    .font(.headline)
                    .padding(.horizontal)
                
                ForEach(detail.ingredients, id: \.self) { ingredient in
                    Text(ingredient)
                        .padding(.horizontal)
                }
            } else {
                ProgressView()
                    .task {
                        await viewModel.loadMealDetail(meal: meal)
                    }
            }
        }
        .navigationTitle(meal.strMeal)
        .navigationBarTitleDisplayMode(.inline)
//        .alert(item: $viewModel.errorMessage) { errorMessage in
//            Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
//        }
    }
}

//#Preview {
//    MealDetailView()
//}
//
