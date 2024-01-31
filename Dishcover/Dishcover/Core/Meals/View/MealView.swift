//
//  MealView.swift
//  Dishcover
//
//  Created by Tolulope Aboyeji on 30/01/2024.
//

import SwiftUI

struct MealView: View {
    
    public let service: MealServiceProtocol
    @StateObject var viewModel: MealsViewModel
    
    init(service: MealServiceProtocol) {
        self.service = service
        self._viewModel = StateObject(wrappedValue: MealsViewModel(service: service))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
                Text("Dishcover")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.top)
                
                if !viewModel.isLoading && viewModel.meals.count > 0 {
                    ScrollView {
                        VStack(spacing: 24) {
                            ForEach(viewModel.meals) { meal in
                                NavigationLink(value: meal.id) {
                                    VStack(alignment: .leading, spacing: 10) {
                                        MealImageView(url: meal.strMealThumb)
                                        
                                        Text(meal.strMeal)
                                            .fontWeight(.bold)
                                            .font(.headline)
                                            .foregroundStyle(.black)
                                    }
                                }
                            }
                        }
                    }
                    .navigationDestination(for: String.self, destination: { id in
                        MealDetailsView(id: id, service: service)
                    })
                } else if viewModel.isLoading {
                    ProgressView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ContentUnavailableView("Meals", systemImage: "fork.knife", description: Text("there are no meals available at this time, please check back later"))
                }
        }
    }
}
#Preview {
    MealView(service: MockMealService())
}
