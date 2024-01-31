//
//  MealsViewModel.swift
//  Dishcover
//
//  Created by Tolulope Aboyeji on 31/01/2024.
//

import Foundation

class MealsViewModel: ObservableObject {
    
    @Published var meals = [Meals]()
    @Published var errorMessage: String?
    @Published var isLoading = false


    
    private let service: MealServiceProtocol
    
    init(service: MealServiceProtocol) {
        self.service = service
        Task {
           await fetchMeals()
        }
    }
    
    @MainActor
    func fetchMeals()  async {
        isLoading = true
        do {
            self.meals = try await service.fetchMeals() ?? []
        } catch {
            guard let error = error as? DishcoverApiError else { return }
            self.errorMessage = error.customDescription
        }
        isLoading = false

    }
    
  
}
