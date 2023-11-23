//
//  ContentView.swift
//  FitBiz
//
//  Created by Tomáš Duchoslav on 19.11.2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ClientListView()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Client.self, inMemory: true)
}
