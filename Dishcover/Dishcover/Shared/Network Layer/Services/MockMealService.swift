//
//  MockMealService.swift
//  Dishcover
//
//  Created by Tolulope Aboyeji on 30/01/2024.
//

import Foundation

class MockMealService: MealServiceProtocol {
    
    var mockData: Data?
    var mockError: DishcoverApiError?
    
    func fetchMeals() async throws -> [Meals]? {
        if let mockError {throw mockError}
        
        do {
            let meals = try JSONDecoder().decode([Meals].self, from: mockData ?? mock_meal_list)
            return meals
        } catch {
            throw error as? DishcoverApiError ?? .unknownError(error: error)
        }
    }
    
    func fetchMealDetails(id: String) async throws -> MealDetails? {
        if let mockError {throw mockError}
        
        do {
            let meals = try JSONDecoder().decode(MealDetails.self, from: mockData ?? mock_meal_details)
            return meals
        } catch {
            throw error as? DishcoverApiError ?? .unknownError(error: error)
        }
    }

    
}
