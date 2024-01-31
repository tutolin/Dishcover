//
//  Meals.swift
//  Dishcover
//
//  Created by Tolulope Aboyeji on 30/01/2024.
//

import Foundation


struct MealResponse: Decodable {
    let meals: [Meals]
}

struct Meals: Decodable, Identifiable, Hashable {
    let strMeal: String
    let strMealThumb: String
    let id: String
   
    
    enum CodingKeys: String, CodingKey {
        case strMeal, strMealThumb
        case id = "idMeal"

    }
}
