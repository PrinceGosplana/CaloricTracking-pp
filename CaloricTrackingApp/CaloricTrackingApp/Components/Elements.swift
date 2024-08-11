//
//  Elements.swift
//  CaloricTrackingApp
//
//  Created by Oleksandr Isaiev on 11.08.2024.
//

import SwiftUI

struct Elements: View {
    let title: String
    let foodElement: CGFloat
    var color = ""
    let width: CGFloat = 130
    var multiplier: CGFloat = 0.65

    var body: some View {
        VStack(spacing: 0) {
            Text(title)
                .font(.caption)
            RoundedRectangle(cornerRadius: 5)
                .frame(width: foodElement * multiplier, height: 5)
                .foregroundStyle(Color(color))
        }
        .padding(.bottom, 5)
        .frame(width: 90)
    }
}

#Preview {
    Elements(title: "protein", foodElement: 3)
}
