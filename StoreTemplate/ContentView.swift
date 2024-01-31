//
//  ContentView.swift
//  StoreTemplate
//
//  Created by Yusuf Gürel on 31.01.2024.
//

import SwiftUI
import StoreKit

struct ContentView: View {
    @AppStorage("subscribed") private var subcribed: Bool = false
    @State var lifetimePage: Bool = false
    
    var body: some View {
        SubscriptionStoreView(groupID: "FC00F658", visibleRelationships: .all) {
            StoreContent()
                .containerBackground(Color.cyan.gradient, for: .subscriptionStoreHeader)
        }
        .backgroundStyle(.clear)
        .subscriptionStorePickerItemBackground(.thinMaterial)
        .storeButton(.visible, for: .restorePurchases)
        .sheet(isPresented: $lifetimePage){
            LifetimeStoreView()
                .presentationDetents([.height(250)])
                .presentationBackground(.ultraThinMaterial)
        }
        Button("More purchase options", action: {
            lifetimePage = true
        })
    }
}

#Preview {
    ContentView()
}
