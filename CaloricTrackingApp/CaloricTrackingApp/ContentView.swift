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

                WaterView()
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
