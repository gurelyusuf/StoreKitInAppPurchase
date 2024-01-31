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
    @State var purchaseStart: Bool = false
    @StateObject var store: Store = Store()
    
    var body: some View {
        SubscriptionStoreView(groupID: "FC00F658", visibleRelationships: .all) {
            StoreContent()
                .containerBackground(Color.cyan.gradient, for: .subscriptionStoreHeader)
        }
        .backgroundStyle(.clear)
        .subscriptionStorePickerItemBackground(.thinMaterial)
        .storeButton(.visible, for: .restorePurchases)
        .overlay {
            if purchaseStart {
                ProgressView().controlSize(.extraLarge)
            }
        }
        .onInAppPurchaseStart { product in
            purchaseStart.toggle()
        }
        .onInAppPurchaseCompletion { product, result in
            purchaseStart.toggle()
            Task {
                await store.updateCustomerProductStatus()
                await updateSubscriptionStatus()
            }
            
        }
        .sheet(isPresented: $lifetimePage){
            LifetimeStoreView()
                .presentationDetents([.height(250)])
                .presentationBackground(.ultraThinMaterial)
        }
        Button("More purchase options", action: {
            lifetimePage = true
        })
    }
    
    @MainActor
    func updateSubscriptionStatus() async {
        if store.subscriptionGroupStatus == .subscribed || store.subscriptionGroupStatus == .inGracePeriod || store.purchasedLifetime {
            subcribed = true
        } else {
            subcribed = false
        }
    }
}

#Preview {
    ContentView()
}
