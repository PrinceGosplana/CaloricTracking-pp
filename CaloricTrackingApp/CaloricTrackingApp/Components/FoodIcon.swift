//
//  FoodIcon.swift
//  CaloricTrackingApp
//
//  Created by Oleksandr Isaiev on 11.08.2024.
//

import SwiftUI

//struct FoodIcon: Identifiable {
//    let id = UUID()
//    let image: String
//}

enum FoodIcon: CaseIterable {
    case coffee, cola, beef, desert, donut, fastFood, hotdog, meat, pizza, fish

    var imageName: String {
        switch self {
        case .coffee: "coffee"
        case .cola: "cola"
        case .beef: "beef"
        case .desert: "desert"
        case .donut: "donut"
        case .fastFood: "fast-food"
        case .hotdog: "hotdog"
        case .meat: "meat"
        case .pizza: "pizza"
        case .fish: "fish"
        }
    }
}
