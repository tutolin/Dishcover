//
//  DishcoverDataService.swift
//  Dishcover
//
//  Created by Tolulope Aboyeji on 30/01/2024.
//

import Foundation

protocol CoinServiceProtocol {
    func fetchMeals() async throws -> MealResponse
    func fetchMealDetails(id: String) async throws -> MealDetailsResponse?
}

class CoinDataService: HTTPDataDownloader, CoinServiceProtocol {
    
    func fetchMeals() async throws -> MealResponse {
        
        guard let endpoint = allMealsURLString() else {
            throw DishcoverApiError.requestFailed(description: "Invalid endpoint")
        }
        return try await fetchData(as: MealResponse.self, endpoint: endpoint)
    }
    
 
    func fetchMealDetails(id: String) async throws -> MealDetailsResponse?  {
        
//        if let cached = CoinDetailsCache.shared.get(forkey: id) {
//            return cached
//        }
        
        guard let endpoint = mealDetailsURLString(id: id) else {
            throw DishcoverApiError.requestFailed(description: "Invalid endpoint")
        }
        return try await fetchData(as: MealDetailsResponse.self, endpoint: endpoint)
    }
    
    
    
    private var baseUrlComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "www.themealdb.com"
        components.path = "/api/json/v1/1/"
        
        return components
    }
    
    private func allMealsURLString() ->  String? {
        var components = baseUrlComponents
        components.path += "filter.php"
        
        components.queryItems = [
            .init(name: "c", value: "Dessert")

        ]
        
        return components.url?.absoluteString
    }
         
    
    private func mealDetailsURLString(id: String) ->  String? {
        var components = baseUrlComponents
        components.path += "lookup.php"

        components.queryItems = [
            .init(name: "i", value: id)

        ]
        
        return components.url?.absoluteString
    }
    
                                               
}
