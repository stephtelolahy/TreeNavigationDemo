//
//  TreeNavigationDemoApp.swift
//  TreeNavigationDemo
//
//  Created by Hugues Stéphano TELOLAHY on 27/02/2025.
//

import SwiftUI
import ComposableArchitecture

@main
struct TreeNavigationDemoApp: App {
    var body: some Scene {
        WindowGroup {
            AppView(
                store: Store(initialState: AppFeature.State()) {
                    AppFeature()
                }
            )
        }
    }
}
