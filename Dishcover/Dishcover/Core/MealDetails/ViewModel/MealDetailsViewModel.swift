//
//  MealDetailsViewModel.swift
//  Dishcover
//
//  Created by Tolulope Aboyeji on 31/01/2024.
//

import Foundation

class MealDetailsViewModel: ObservableObject {
    
    @Published var mealDetails: MealDetails?
    @Published var errorMessage: String?
    @Published var isLoading = false

    
    private let service: MealServiceProtocol
    private var mealId: String
    
    init(mealId: String, service: MealServiceProtocol) {
        self.service = service
        self.mealId = mealId
        Task {
           await fetchMealDetails()
        }
    }
    
    @MainActor
    func fetchMealDetails()  async {
        isLoading = true
        do {
            print(mealId)
            self.mealDetails = try await service.fetchMealDetails(id: mealId )
        } catch {
            guard let error = error as? DishcoverApiError else { return }
            self.errorMessage = error.customDescription
        }
        isLoading = false

    }
    
  
}
