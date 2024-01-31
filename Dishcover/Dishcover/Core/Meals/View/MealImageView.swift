//
//  MealImageView.swift
//  Dishcover
//
//  Created by Tolulope Aboyeji on 31/01/2024.
//

import SwiftUI

struct MealImageView: View {
    
    @ObservedObject var imageLoader: ImageLoader
    
    init(url: String) {
        imageLoader = ImageLoader(url: url)
    }
    
    var body: some View {
        if let image = imageLoader.image {
            image
                .resizable()
                .scaledToFill()
                .frame(width: 360, height: 150)
                .cornerRadius(10)
        }
    }
}

#Preview {
    MealImageView(url: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
}
