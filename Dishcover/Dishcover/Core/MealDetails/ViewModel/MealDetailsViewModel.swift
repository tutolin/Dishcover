//
//  MealDetailsViewModel.swift
//  Dishcover
//
//  Created by Tolulope Aboyeji on 31/01/2024.
//

import Foundation

class MealDetailsViewModel: ObservableObject {
    
    private let service: MealServiceProtocol
    private var mealId: String
    
    @Published var mealDetails: MealDetails?

    
    
    init(mealId: String, service: MealServiceProtocol) {
        self.service = service
        self.mealId = mealId
    }
    
    @MainActor
    func fetchCoins()  async throws {
        do {
            self.mealDetails = try await service.fetchMealDetails(id: mealId )
        } catch {
            print("error")
        }
    }
    
  
}
