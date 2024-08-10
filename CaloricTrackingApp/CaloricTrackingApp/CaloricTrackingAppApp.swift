//
//  CaloricTrackingAppApp.swift
//  CaloricTrackingApp
//
//  Created by Oleksandr Isaiev on 09.08.2024.
//

import SwiftUI

@main
struct CaloricTrackingAppApp: App {
    @StateObject var dataModel = CDDataModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataModel)
        }
    }
}
