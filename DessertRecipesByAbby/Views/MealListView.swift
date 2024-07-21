//
//  Menu.swift
//  DessertRecipesByAbby
//
//  Created by Yao Liu on 7/21/24.
//

import SwiftUI

struct MealListView: View {
    @ObservedObject var viewModel: MealViewModel

    var body: some View {
        List(viewModel.meals) { meal in
            NavigationLink(destination: MealDetailView(meal: meal, viewModel: viewModel)) {
                HStack {
                    if let imageUrl = meal.strMealThumb, let url = URL(string: imageUrl) {
                        AsyncImage(url: url) { image in
                            image.resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .clipped()
                        } placeholder: {
                            ProgressView()
                        }
                    }
                    Text(meal.strMeal)
                }
            }
        }
//        .alert(item: $viewModel.errorMessage) { errorMessage in
//            Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
//        }
    }
}

//#Preview {
//    MealListView()
//}
