//
//  WaterView.swift
//  CaloricTrackingApp
//
//  Created by Oleksandr Isaiev on 11.08.2024.
//

import SwiftUI

struct WaterView: View {
    @State private var checkMark = false

    var body: some View {
        VStack(spacing: 5) {
            HStack(spacing: 0) {
                Text("6 of 6 glasses")
                    .bold()
                    .font(.title3)
                    .offset(y: -10)
                Spacer()
                Image(.waterGlass)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 70)
            }
            .padding(.horizontal)

            HStack(spacing: 10) {
                ForEach(0 ..< 6) { item in
                    HStack(spacing: 8) {
                        ZStack {
                            Circle()
                                .frame(width: 50, height: 50)
                                .foregroundStyle(.blue.opacity(checkMark ? 0.1 : 0.03))
                            Image(systemName: "drop.halffull")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 25, height: 25)
                                .symbolRenderingMode(.multicolor)
                                .foregroundStyle(.blue)
                                .onTapGesture {
                                    checkMark.toggle()
                                }
                        }
                        .overlay(alignment: .topTrailing) {
                            ZStack {
                                Circle()
                                    .foregroundStyle(.yellow)
                                    .frame(width: 15, height: 15)
                                Image(systemName: checkMark ? "checkmark" : "")
                                    .bold()
                                    .font(.caption2)
                                    .foregroundStyle(.green)
                            }
                        }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 130)
        .background(.yellow)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(.horizontal)
        .customShadow()
    }
}

#Preview {
    WaterView()
}
