//
//  SelectedFood.swift
//  CaloricTrackingApp
//
//  Created by Oleksandr Isaiev on 10.08.2024.
//

import SwiftUI

struct SelectedFood: Identifiable {
    let id = UUID()
    let food: String
    let tab: Tab
}

extension SelectedFood {
    static let items: [SelectedFood] = [
        .init(food: "Breakfast", tab: .breakfast),
        .init(food: "Lunch", tab: .lunch),
        .init(food: "Dinner", tab: .dinner),
        .init(food: "Snaks", tab: .svacks)
    ]
}
