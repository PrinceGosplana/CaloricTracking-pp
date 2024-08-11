//
//  TabView.swift
//  CaloricTrackingApp
//
//  Created by Oleksandr Isaiev on 10.08.2024.
//

import SwiftUI

struct TabView: View {
    @Binding var selectedItem: Tab

    @Namespace private var animation

    var body: some View {
        HStack(spacing: 30) {
            ForEach(SelectedFood.items) { item in
                Button {
                    withAnimation {
                        selectedItem = item.tab
                    }
                } label: {
                    Text(item.food)
                        .foregroundStyle(selectedItem == item.tab ? .white : .black)
                        .padding(8)
                        .background {
                            if selectedItem == item.tab {
                                Capsule()
                                    .fill(.black)
                                    .matchedGeometryEffect(id: "ACTIVETAB", in: animation)
                            }
                        }
                }
            }
        }
    }
}

#Preview {
    TabView(selectedItem: .constant(.lunch))
}
