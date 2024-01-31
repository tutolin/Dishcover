//
//  MealDetails.swift
//  Dishcover
//
//  Created by Tolulope Aboyeji on 30/01/2024.
//

import Foundation

import Foundation

struct MealDetailsResponse: Decodable {
    let meals: [MealDetails]
}

struct MealDetails: Decodable, Identifiable, Hashable {
    let id: String
    let strMeal: String
    let strDrinkAlternate: String?
    let strCategory: String
    let strArea: String
    let strInstructions: String
    let strMealThumb: String
    let strTags: String
    let strYoutube: String
    let strSource: String
    let strImageSource: String?
    let strCreativeCommonsConfirmed: String?
    let dateModified: String?
    let ingredients: [String]
    let measures: [String]

    
    enum CodingKeys: String, CodingKey {
        case id = "idMeal"
        case strMeal, strDrinkAlternate, strCategory, strArea, strInstructions, strMealThumb, strTags, strYoutube, strSource, strImageSource, strCreativeCommonsConfirmed, dateModified
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        strMeal = try container.decode(String.self, forKey: .strMeal)
        strDrinkAlternate = try container.decodeIfPresent(String.self, forKey: .strDrinkAlternate)
        strCategory = try container.decode(String.self, forKey: .strCategory)
        strArea = try container.decode(String.self, forKey: .strArea)
        strInstructions = try container.decode(String.self, forKey: .strInstructions)
        strMealThumb = try container.decode(String.self, forKey: .strMealThumb)
        strTags = try container.decode(String.self, forKey: .strTags)
        strYoutube = try container.decode(String.self, forKey: .strYoutube)
        strSource = try container.decode(String.self, forKey: .strSource)
        strImageSource = try container.decodeIfPresent(String.self, forKey: .strImageSource)
        strCreativeCommonsConfirmed = try container.decodeIfPresent(String.self, forKey: .strCreativeCommonsConfirmed)
        dateModified = try container.decodeIfPresent(String.self, forKey: .dateModified)
        
   
        let ingredients = try container.allKeys
            .filter { $0.stringValue.hasPrefix("strIngredient") }
            .compactMap { key -> String? in
                guard let ingredient = try container.decodeIfPresent(String.self, forKey: key), !ingredient.isEmpty else {
                    return nil
                }
                return ingredient
            }
        self.ingredients = ingredients
        
        let measures = try container.allKeys
            .filter { $0.stringValue.hasPrefix("strMeasure") }
            .compactMap { key -> String? in
                guard let measure = try container.decodeIfPresent(String.self, forKey: key), !measure.isEmpty else {
                    return nil
                }
                return measure
            }
        self.measures = measures
        
        
    }
}
