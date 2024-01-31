//
//  StoreContent.swift
//  StoreTemplate
//
//  Created by Yusuf Gürel on 31.01.2024.
//

import SwiftUI

struct StoreContent: View {
    @AppStorage("subscribed") private var subscribed: Bool = false
    var body: some View {
        ZStack {
            VStack {
                Text(subscribed ? "Thanks" : "Choose a plan")
                    .font(.largeTitle.bold())
                Text(subscribed ? "You are subscribed" : "A purchase is required to use this app")
                Image(.store)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 100)
                    .padding()
                
            }
        }
    }
}

#Preview {
    StoreContent()
}
