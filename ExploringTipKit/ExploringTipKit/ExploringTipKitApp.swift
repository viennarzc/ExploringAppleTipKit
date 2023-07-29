//
//  ExploringTipKitApp.swift
//  ExploringTipKit
//
//  Created by Viennarz Curtiz on 7/8/23.
//

import SwiftUI
import TipKit

@main
struct ExploringTipKitApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .task {
                    // Configure and load your tips at app launch.
                    try? await Tips.configure {
                        DisplayFrequency(.immediate)
                        DatastoreLocation(.applicationDefault)
                    }
                }
        }
    }
    
}
