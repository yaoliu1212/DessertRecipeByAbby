//
//  ContentView.swift
//  DessertRecipesByAbby
//
//  Created by Yao Liu on 7/21/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = MealViewModel()
    
    var body: some View {
        NavigationView {
            MealListView(viewModel: viewModel)
                .navigationTitle("Dessert Recipes")
        }
        .task {
            await viewModel.loadMeals()
        }
    }
}

//#Preview {
//    ContentView()
//}
