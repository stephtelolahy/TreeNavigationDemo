//
//  AddContactView.swift
//  TreeNavigationDemo
//
//  Created by Hugues Stéphano TELOLAHY on 08/03/2025.
//

import SwiftUI
import ComposableArchitecture

struct AddContactView: View {
    @Bindable var store: StoreOf<AddContactFeature>

    var body: some View {
        Form {
            TextField("Name", text: $store.contact.name.sending(\.setName))
            Button("Save") {
                store.send(.saveButtonTapped)
            }
        }
        .toolbar {
            ToolbarItem {
                Button("Cancel") {
                    store.send(.cancelButtonTapped)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        AddContactView(
            store: Store(
                initialState: AddContactFeature.State(
                    contact: Contact(
                        id: UUID(),
                        name: "Blob"
                    )
                )
            ) {
                AddContactFeature()
            }
        )
    }
}

@Reducer
struct AddContactFeature {
    @ObservableState
    struct State: Equatable {
        var contact: Contact
    }

    enum Action {
        case cancelButtonTapped
        case saveButtonTapped
        case setName(String)
        case delegate(Delegate)

        enum Delegate {
            case save(Contact)
            case cancel
        }
    }

    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .cancelButtonTapped:
                return .send(.delegate(.cancel))

            case .saveButtonTapped:
                return .send(.delegate(.save(state.contact)))

            case let .setName(name):
                state.contact.name = name
                return .none

            case .delegate:
                return .none
            }
        }
    }
}
