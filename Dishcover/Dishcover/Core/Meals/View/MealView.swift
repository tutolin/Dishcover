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
        NavigationStack {
            VStack(alignment: .leading) {
                Text("Dishcover: \nDiscover new ways to cook")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding()
                
                if viewModel.isLoading {
                    ProgressView()
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    ScrollView {
                        VStack(spacing: 24) {
                            ForEach(viewModel.meals) { meal in
                                VStack(alignment: .leading, spacing: 10) {
                                    MealImageView(url: meal.strMealThumb)
                                    
                                    Text(meal.strMeal)
                                        .fontWeight(.bold)
                                        .font(.headline)
                                    
                                }
                                .overlay {
                                    if let error = viewModel.errorMessage {
                                        Text(error)
                                    }
                                }
                            }
                        }
                        
                    }
                }
               
            }
        }
    }
}

#Preview {
    MealView(service: MealDataService())
}
