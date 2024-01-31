//
//  LifetimeStoreView.swift
//  StoreTemplate
//
//  Created by Yusuf Gürel on 31.01.2024.
//

import SwiftUI
import StoreKit

struct LifetimeStoreView: View {
    
    @AppStorage("subscribed") private var subscribed: Bool = false
    
    var body: some View {
        Image(.store)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .frame(width: 100)
            .padding(.top, 20)
        StoreView(ids: ["lifetime_subscription"])
            .productViewStyle(.large)
    }
}

#Preview {
    LifetimeStoreView()
}
