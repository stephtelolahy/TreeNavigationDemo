//
//  ContactDetailView.swift
//  TreeNavigationDemo
//
//  Created by Hugues Stéphano TELOLAHY on 08/03/2025.
//

import SwiftUI
import ComposableArchitecture

struct ContactDetailView: View {
    let store: StoreOf<ContactDetailFeature>
    
    var body: some View {
        Form {
        }
        .navigationTitle(Text(store.contact.name))
    }
}

#Preview {
    NavigationStack {
        ContactDetailView(
            store: Store(
                initialState: ContactDetailFeature.State(
                    contact: Contact(id: UUID(), name: "Blob")
                )
            ) {
                ContactDetailFeature()
            }
        )
    }
}

@Reducer
struct ContactDetailFeature {
    @ObservableState
    struct State: Equatable {
        let contact: Contact
    }
    
    enum Action {
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            }
        }
    }
}
