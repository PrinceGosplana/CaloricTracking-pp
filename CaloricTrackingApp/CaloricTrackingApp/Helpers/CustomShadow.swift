//
//  CustomShadow.swift
//  CaloricTrackingApp
//
//  Created by Oleksandr Isaiev on 10.08.2024.
//

import SwiftUI

struct CustomShadow: ViewModifier {
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.2), radius: 20, x: 0.0, y: 0.0)
    }
}

extension View {
    func customShadow() -> some View {
        modifier(CustomShadow())
    }
}
