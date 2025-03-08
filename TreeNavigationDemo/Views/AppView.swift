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

            ContactsView(store: store.scope(state: \.contacts, action: \.contacts))
            .tag(AppFeature.Tab.contacts)
            .tabItem {
                Text("Contacts")
            }

            NavigationStack {
                SecondTabView(store: store.scope(state: \.secondTab, action: \.secondTab))
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
        var contacts = ContactsFeature.State()
        var secondTab = SecondTabFeature.State()
        var currentTab: Tab = .contacts
    }

    enum Action {
        case contacts(ContactsFeature.Action)
        case secondTab(SecondTabFeature.Action)
        case tabChanged(Tab)
    }

    enum Tab: Int, CaseIterable, Identifiable {
        case contacts
        case secondTab

        var id: Int { self.rawValue }
    }

    var body: some ReducerOf<Self> {
        Scope(state: \.contacts, action: \.contacts) {
            ContactsFeature()
        }
        Scope(state: \.secondTab, action: \.secondTab) {
            SecondTabFeature()
        }
        Reduce { state, action in
            switch action {
            case .tabChanged(let selectedTab):
                state.currentTab = selectedTab
                return .none
            default:
                return .none
            }
        }
    }
}
