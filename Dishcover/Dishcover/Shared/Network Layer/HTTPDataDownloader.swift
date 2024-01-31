//
//  HTTPDataDownloader.swift
//  Dishcover
//
//  Created by Tolulope Aboyeji on 30/01/2024.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

protocol HTTPDataDownloader {
    func fetchData<T: Decodable>(as type: T.Type, endpoint: String, method: HTTPMethod, body: Data?) async throws -> T
}

extension HTTPDataDownloader {
    func fetchData<T: Decodable>(as type: T.Type, endpoint: String, method: HTTPMethod = .get, body: Data? = nil) async throws -> T {
        guard let url = URL(string: endpoint) else {
            throw DishcoverApiError.requestFailed(description: "Invalid URL")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.httpBody = body
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
                    throw DishcoverApiError.requestFailed(description: "Request Failed")
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            throw DishcoverApiError.invalidStatusCode(statusCode: httpResponse.statusCode)
        }
        
        do {
         return try JSONDecoder().decode(type, from: data)
            
        } catch {
            print("DEBUG: Error \((error))")
            throw error as? DishcoverApiError ?? .unknownError(error: error)
        }
    }
}
