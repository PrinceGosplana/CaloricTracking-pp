//
//  Values.swift
//  CaloricTrackingApp
//
//  Created by Oleksandr Isaiev on 11.08.2024.
//

import SwiftUI

struct Values: View {
    @Binding var number: String
    @Binding var show: Bool
    var name = ""

    var body: some View {
        HStack(spacing: 0) {
            HStack {
                Text(name)
                    .font(.title2)
                    .frame(maxWidth: .infinity, alignment: .leading)

                Text(number)
                    .font(.title2.bold())
                    .frame(width: 45, height: 30)
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .foregroundStyle(.white)
                    .onTapGesture {
                        withAnimation {
                            show.toggle()
                        }
                    }
            }

            if show {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 5) {
                        ForEach(1 ..< 100) { item in
                            Circle()
                                .fill(.black.opacity(0.6))
                                .frame(width: 30, height: 30)
                                .overlay {
                                    Text("\(item)")
                                        .foregroundStyle(.white)
                                        .frame(width: 30, height: 30)
                                        .onTapGesture {
                                            withAnimation {
                                                show.toggle()
                                                number = "\(item)"
                                            }
                                        }
                                }
                        }
                    }
                }
                .frame(width: 180, height: 30)
            }

        }
        .padding(5)
    }
}

#Preview {
    AddView()
        .environmentObject(CDDataModel())
}
