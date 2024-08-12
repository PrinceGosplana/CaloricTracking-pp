//
//  FoodCardView.swift
//  CaloricTrackingApp
//
//  Created by Oleksandr Isaiev on 11.08.2024.
//

import SwiftUI

struct FoodCardView: View {
    var width: CGFloat
    var title: String
    var imageName: String
    var multiplier: CGFloat {
        width / 200
    }

    @State var cards: CGFloat = 20
    @State var protein: CGFloat = 100
    @State var fat: CGFloat = 70
    @State var name: String = ""
    @State var icon: String = ""

    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
            HStack {
                Text(name)
                    .font(.title2)
                    .frame(width: 160)
                    .lineLimit(1)
                    .minimumScaleFactor(0.7)
                    .bold()
            }

            HStack(spacing: 0) {
                Text(title)

                Spacer()
            }
            .frame(width: 200, height: 30)
            .minimumScaleFactor(0.6)
        }
        .offset(x: 20, y: -20)
        .frame(width: 270, height: 110)
        .background(.indigo.opacity(0.4).gradient)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .customShadow()
        .overlay(alignment: .topLeading) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 65, height: 65)
                .offset(x: -12, y: -16)
        }
        .overlay(alignment: .bottom) {
            HStack(spacing: 10) {
                Elements(title: "cards", foodElement: cards, color: "cards", multiplier: multiplier)
                Elements(title: "fat", foodElement: fat, color: "fat", multiplier: multiplier)
                Elements(title: "protein", foodElement: protein, color: "protein", multiplier: multiplier)
            }
        }
    }
}

#Preview {
    FoodCardView(width: 12, title: "cola", imageName: "cola")
}
