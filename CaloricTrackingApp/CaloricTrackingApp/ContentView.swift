//
//  ContentView.swift
//  CaloricTrackingApp
//
//  Created by Oleksandr Isaiev on 09.08.2024.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var dataModel: CDDataModel
    @State private var selectedItem: Tab = .breakfast
    @State private var show = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 5) {
                HStack(spacing: 50) {
                    Text("Hi!")
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)

                    Image(.fastFood)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 50, height: 50)
                        .shadow(color: .blue, radius: 20, x: 0, y: 0)
                        .clipShape(Circle())
                }
                .padding(.horizontal)

                RingView()

                TabView(selectedItem: $selectedItem)

                if selectedItem == .breakfast {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(dataModel.saveBreakfastEntity) { item in
                                FoodCardView(
                                    width: 200,
                                    title: item.ingredients ?? "",
                                    imageName: item.imageName ?? "",
                                    cards: CGFloat(item.cards),
                                    protein: CGFloat(item.protein),
                                    fat: CGFloat(item.fat),
                                    name: item.name ?? "",
                                    icon: item.icon ?? ""
                                )
                                    .padding(.leading)
                                    .overlay(alignment: .topTrailing) {
                                        Button {
                                            dataModel.addValue(
                                                fat: CGFloat(item.fat),
                                                protein: CGFloat(item.protein),
                                                cards: CGFloat(
                                                    item.cards
                                                )
                                            )

                                            dataModel.addBreakfastToggle(breakfast: item)
                                            dataModel.addCalories(calories: CGFloat(item.cards))
                                        } label: {
                                            ZStack {
                                                Circle()
                                                    .frame(width: 30, height: 30)
                                                Image(systemName: item.addmale ? "checkmark" : "plus")
                                                    .imageScale(.small)
                                                    .foregroundStyle(.black)
                                            }
                                            .customShadow()
                                        }
                                        .offset(x: -5, y: 5)
                                    }
                            }
                        }
                        .frame(height: 180)
                    }
                    .offset(y: -30)
                } else if selectedItem == .lunch {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(dataModel.saveLunchEntity) { item in
                                FoodCardView(
                                    width: 200,
                                    title: item.ingredients ?? "",
                                    imageName: item.imageName ?? "",
                                    cards: CGFloat(item.cards),
                                    protein: CGFloat(item.protein),
                                    fat: CGFloat(item.fat),
                                    name: item.name ?? "",
                                    icon: item.icon ?? ""
                                )
                                    .padding(.leading)
                                    .overlay(alignment: .topTrailing) {
                                        Button {

                                        } label: {
                                            ZStack {
                                                Circle()
                                                    .frame(width: 30, height: 30)
                                            }
                                            .customShadow()
                                        }
                                        .offset(x: -5, y: 5)
                                    }
                            }
                        }
                        .frame(height: 180)
                    }
                }

                WaterView()

                Spacer()
                    .overlay(alignment: .bottomLeading) {
                        Button {
                            show.toggle()
                        } label: {
                            Text("New meat")
                                .bold()
                                .foregroundStyle(.black)
                                .frame(width: 150, height: 56)
                                .background(.white)
                                .clipShape(Capsule())
                                .customShadow()
                        }
                        .padding()
                    }
                    .sheet(isPresented: $show, content: {
                        AddView()
                    })
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
