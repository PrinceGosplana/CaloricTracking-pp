//
//  AddView.swift
//  CaloricTrackingApp
//
//  Created by Oleksandr Isaiev on 11.08.2024.
//

import SwiftUI

struct AddView: View {
    @EnvironmentObject var dataModel: CDDataModel
    @Environment(\.dismiss) var dismiss
    @State private var selectedTab: Tab = .breakfast
    @State private var showIcon = false
    @State private var icon: String = "plus"
    @State private var name = ""
    @State private var title = ""
    @State private var fat = "0"
    @State private var protein = "0"
    @State private var cards = "0"
    @State private var fatTF = false
    @State private var proteinTF = false
    @State private var cardTF = false

    var body: some View {
        VStack(spacing: 0) {
            Spacer()
            TabView(selectedItem: $selectedTab)

            VStack(spacing: 25) {
                Image(icon)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .onTapGesture {
                        withAnimation(.snappy) {
                            showIcon.toggle()
                        }
                    }
                if showIcon {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 8) {
                            ForEach(FoodIcon.allCases, id: \.hashValue) { item in
                                Image(item.imageName)
                                    .resizable()
                                    .scaledToFill()
                                .frame(width: 50, height: 50)
                                .onTapGesture {
                                    icon = item.imageName
                                    withAnimation(.snappy) {
                                        showIcon.toggle()
                                    }
                                }
                            }
                        }
                    }
                }

                VStack(spacing: 10) {
                    TextField("Name", text: $name)
                    Divider()
                    TextField("Title", text: $title)
                }
                .font(.title3)
                .padding()
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .customShadow()

                VStack(spacing: 0) {
                    Values(number: $fat, show: $fatTF, name: "Fat")
                    Values(number: $protein, show: $proteinTF, name: "Protein")
                    Values(number: $cards, show: $cardTF, name: "Cards")
                }
                .padding()
                .background(.white)
                .clipShape(.rect(cornerRadius: 20))
                .customShadow()

                Button {
                    switch selectedTab {
                    case .breakfast:
                        dataModel.addBreakfast(
                            icon: icon,
                            name: name,
                            ingredients: title,
                            fat: CGFloat(Int(fat) ?? 0),
                            protein: CGFloat(Int(protein) ?? 0),
                            cards: CGFloat(Int(cards) ?? 0)
                        )
                        dismiss()
                    case .lunch:
                        dataModel.addLunch(
                            icon: icon,
                            name: name,
                            ingredients: title,
                            fat: CGFloat(Int(fat) ?? 0),
                            protein: CGFloat(Int(protein) ?? 0),
                            cards: CGFloat(Int(cards) ?? 0)
                        )
                        dismiss()
                    case .dinner:
                        print("Dinner")
                    case .svacks:
                        print("snacks")
                    }
                } label: {
                    Text("Save")
                        .font(.title2.bold())
                        .foregroundStyle(.black)
                        .frame(minWidth: 180, minHeight: 50)
                        .background(.white)
                        .clipShape(.rect(cornerRadius: 10))
                        .customShadow()
                }
            }
            .padding()
            Spacer()
        }
        .overlay(alignment: .topTrailing) {
            Button {
                dismiss()
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 30, height: 30)
                        .foregroundStyle(.black)
                    Image(systemName: "xmark")
                        .imageScale(.large)
                        .foregroundStyle(.white)
                }
                .padding()
                .customShadow()
            }
        }
    }
}

#Preview {
    AddView()
        .environmentObject(CDDataModel())
}
