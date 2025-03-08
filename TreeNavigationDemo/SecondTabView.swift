//
//  SecondTabView.swift
//  TreeNavigationDemo
//
//  Created by Hugues Stéphano TELOLAHY on 27/02/2025.
//

import SwiftUI
import ComposableArchitecture

struct SecondTabView: View {
    @Bindable var store: StoreOf<SecondTabFeature>

    var body: some View {
        Text("Second Tab")
    }
}

#Preview {
    SecondTabView(
        store: Store(initialState: SecondTabFeature.State()) {
            SecondTabFeature()
        }
    )
}

@Reducer
struct SecondTabFeature {
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
