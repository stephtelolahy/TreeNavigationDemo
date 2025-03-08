//
//  AppView.swift
//  TreeNavigationDemo
//
//  Created by Hugues Stéphano TELOLAHY on 27/02/2025.
//

import SwiftUI
import ComposableArchitecture

struct AppView: View {
    @Bindable var store: StoreOf<AppFeature>

    var body: some View {
        TabView(selection: $store.currentTab.sending(\.tabChanged)) {

            NavigationStack {
                FirstTabView(
                    store: store.scope(
                        state: \.firstTab,
                        action: \.firstTab
                    )
                )
            }
            .tag(AppFeature.Tab.firstTab)
            .tabItem {
                Text("Tab 1")
            }

            NavigationStack {
                SecondTabView(
                    store: store.scope(
                        state: \.secondTab,
                        action: \.secondTab
                    )
                )
            }
            .tag(AppFeature.Tab.secondTab)
            .tabItem {
                Text("Tab 2")
            }
        }
    }
}

#Preview {
    AppView(
        store: Store(initialState: AppFeature.State()) {
            AppFeature()
        }
    )
}

@Reducer
struct AppFeature {
    @ObservableState
    struct State: Equatable {
        var firstTab = FirstTabFeature.State()
        var secondTab = SecondTabFeature.State()
        var currentTab: Tab = .firstTab
    }

    enum Action {
        case firstTab(FirstTabFeature.Action)
        case secondTab(SecondTabFeature.Action)
        case tabChanged(Tab)
    }

    enum Tab: Int, CaseIterable, Identifiable {
        case firstTab
        case secondTab

        var id: Int { self.rawValue }
    }

    var body: some ReducerOf<Self> {
        Scope(state: \.firstTab, action: \.firstTab) {
            FirstTabFeature()
        }
        Scope(state: \.secondTab, action: \.secondTab) {
            SecondTabFeature()
        }
        Reduce { state, action in
            switch action {
            case .firstTab:
                return .none
            case .secondTab:
                return .none
            case .tabChanged(let selectedTab):
                state.currentTab = selectedTab
                return .none
            }
        }
    }
}
