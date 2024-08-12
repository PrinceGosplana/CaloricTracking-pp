//
//  RingView.swift
//  CaloricTrackingApp
//
//  Created by Oleksandr Isaiev on 10.08.2024.
//

import SwiftUI

struct RingView: View {

    @EnvironmentObject var dataModel: CDDataModel
    private let percent: CGFloat = 50
    private let width: CGFloat = 130
    private let height: CGFloat = 130
    private var perc: CGFloat = 1000

    var body: some View {
        let ringValue = dataModel.saveValueEntity.first
        let multiplier = width / 44
        let progress = 1 - ((ringValue?.ring ?? 0) / 1700)

        return HStack(spacing: 40) {
            ZStack {
                Circle()
                    .stroke(Color.blue.opacity(0.1), style: StrokeStyle(lineWidth: 4 * multiplier))
                    .frame(width: width, height: height)
                Circle()
                    .trim(from: CGFloat(progress), to: 1)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.green, .blue]),
                            startPoint: .top,
                            endPoint: .bottom
                        ),
                        style: StrokeStyle(
                            lineWidth: 5 * multiplier,
                            lineCap: .round,
                            lineJoin: .round,
                            miterLimit: .infinity,
                            dash: [20, 0],
                            dashPhase: 0
                        )
                    )
                    .rotationEffect(Angle(degrees: 90))
                    .rotation3DEffect(
                        Angle(degrees: 180),
                        axis: (x: 1.0, y: 0.0, z: 0.0)
                    )
                    .frame(width: width, height: height)
                Text("1799")
                    .bold()
                    .font(.title)
            }

            HStack(spacing: 30) {
                ForEach(dataModel.saveValueEntity) {
                    FoodElementValue(
                        element: "Cards",
                        gram: String(format: "0.0", $0.cards),
                        color: "cards",
                        elementValue: CGFloat($0.cards)
                    )

                    FoodElementValue(
                        element: "Cards",
                        gram: String(format: "0.0", $0.fat),
                        color: "fat",
                        elementValue: CGFloat($0.fat)
                    )

                    FoodElementValue(
                        element: "Cards",
                        gram: String(format: "0.0", $0.protein),
                        color: "protein",
                        elementValue: CGFloat($0.protein)
                    )
                }
            }
        }
        .frame(height: 180)
        .frame(width: UIScreen.main.bounds.width - 20)
        .background(.white)
        .clipShape(.rect(cornerRadius: 20))
        .customShadow()
    }
}

#Preview {
    RingView()
        .environmentObject(CDDataModel())
}
