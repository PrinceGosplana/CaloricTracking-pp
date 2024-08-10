//
//  FoodElementValue.swift
//  CaloricTrackingApp
//
//  Created by Oleksandr Isaiev on 10.08.2024.
//

import SwiftUI

struct FoodElementValue: View {
    let element: String
    let gram: String
    let color: String
    let elementValue: CGFloat
    let height: CGFloat = 130
    var multiplier: CGFloat {
        height / 2000
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            Rectangle()
                .frame(width: 8, height: 110)
                .foregroundStyle(.gray.opacity(0.5))

            if elementValue != 0 {
                Rectangle()
                    .frame(width: 8, height: elementValue * multiplier)
                    .foregroundStyle(Color(color))
            } else {
                Rectangle()
                    .frame(width: 8, height: 110)
                    .foregroundStyle(Color(color))
            }
        }
        .clipShape(.rect(cornerRadius: 10))

        Text(element)
            .font(.system(size: 12))
        Text(gram)
            .font(.system(size: 10))
    }
}

#Preview {
    FoodElementValue(element: "", gram: "", color: "", elementValue: 0)
}
