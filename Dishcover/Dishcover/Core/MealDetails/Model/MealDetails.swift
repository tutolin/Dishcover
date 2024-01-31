//
//  MealDetails.swift
//  Dishcover
//
//  Created by Tolulope Aboyeji on 30/01/2024.
//

import Foundation

import Foundation

struct MealDetailsResponse: Codable {
    let meals: [MealDetails]
}

struct MealDetails: Codable, Identifiable, Hashable {
    let id: String
    let strMeal: String
    let strInstructions: String
    let strMealThumb: String
    let ingredients: [String]
    let measures: [String]
    
     var ingredientMeasures: [String] {
         zip(ingredients, measures).map { "\($0) - \($1)" }
     }
    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case strMeal, strInstructions, strMealThumb
    }
    
    struct DynamicKey: CodingKey {
        var stringValue: String
        var intValue: Int?
        init?(stringValue: String) {
            self.stringValue = stringValue
        }
        init?(intValue: Int) {
            self.stringValue = "\(intValue)";
            self.intValue = intValue
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)
        strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
    
        let dynamicContainer = try decoder.container(keyedBy: DynamicKey.self)

        let ingredientKeys = dynamicContainer.allKeys.filter { $0.stringValue.starts(with: "strIngredient") }.sorted(by: { $0.stringValue < $1.stringValue })
        let measureKeys = dynamicContainer.allKeys.filter { $0.stringValue.starts(with: "strMeasure") }.sorted(by: { $0.stringValue < $1.stringValue })

        ingredients = ingredientKeys.compactMap { try? dynamicContainer.decodeIfPresent(String.self, forKey: $0) }.filter { !$0.trimmingCharacters(in: .whitespaces).isEmpty }
        measures = measureKeys.compactMap { try? dynamicContainer.decodeIfPresent(String.self, forKey: $0) }.filter { !$0.trimmingCharacters(in: .whitespaces).isEmpty }
        
        
    }
}
