//
//  MealDetailsView.swift
//  Dishcover
//
//  Created by Tolulope Aboyeji on 31/01/2024.
//

import SwiftUI

struct MealDetailsView: View {
    
    let id: String
    @ObservedObject var viewModel: MealDetailsViewModel
    
    init(id: String, service: MealServiceProtocol) {
        self.id = id
        self.viewModel = MealDetailsViewModel(mealId: id, service: service)
    }
    
    
    
    var body: some View {
        if !viewModel.isLoading {
            ScrollView {
                if let details = viewModel.mealDetails {
                MealImageView(url: details.strMealThumb)

                VStack(alignment: .leading, spacing: 10) {
                        Text(details.strMeal)
                            .fontWeight(.bold)
                            .font(.title2)
                            .padding(.vertical)
                        
                        
                        Section(header: Text("Meal Instructions:").font(.title2)) {
                            Text(details.strInstructions)
                                .font(.footnote)
                                .padding(.bottom, 20)
                        }.padding(.bottom, 20)
                        
                        Section(header: Text("Ingredients & Measures:").font(.title2)) {
                            ForEach(details.ingredientMeasures, id: \.self) { item in
                                Text(item)
                                    .font(.footnote)
                            }
                        }.padding(.bottom, 20)
                        
                        
                }.padding()
                    
                }
            }
            
        } else if viewModel.isLoading {
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }

    }
}

#Preview {
    MealDetailsView(id: "", service: MockMealService())
}
