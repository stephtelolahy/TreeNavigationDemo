//
//  FirstTabView.swift
//  TreeNavigationDemo
//
//  Created by Hugues Stéphano TELOLAHY on 27/02/2025.
//

import SwiftUI
import ComposableArchitecture

@Reducer
struct FirstTabFeature {
    @ObservableState
    struct State: Equatable {
    }

    enum Action {
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            .none
        }
    }
}

struct FirstTabView: View {
    @Bindable var store: StoreOf<FirstTabFeature>

    var body: some View {
        Text("First Tab")
    }
}

#Preview {
    FirstTabView(
        store: Store(initialState: FirstTabFeature.State()) {
            FirstTabFeature()
        }
    )
}
