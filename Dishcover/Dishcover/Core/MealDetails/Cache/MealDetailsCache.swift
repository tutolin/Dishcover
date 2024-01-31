//
//  MealDetailsCache.swift
//  Dishcover
//
//  Created by Tolulope Aboyeji on 31/01/2024.
//

import Foundation

class MealDetailsCache {
    
    static let shared = MealDetailsCache()
    
    private let cache = NSCache<NSString, NSData>()
    
    private init() {}
    
    func set(_ mealDetails: MealDetails, forkey key: String) {
        guard let data = try? JSONEncoder().encode(mealDetails) else { return }
        cache.setObject(data as NSData, forKey: key as NSString)
    }
    
    func get(forkey key: String) -> MealDetails? {
        guard let data = cache.object(forKey: key as NSString) as? Data else {return nil}
        return try? JSONDecoder().decode(MealDetails.self, from: data)
    }
}
