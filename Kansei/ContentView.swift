//
//  ContentView.swift
//  Kansei
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem { Image(systemName: "house") }
            StatsView()
                .tabItem { Image(systemName: "chart.bar") }
        }
    }
}

#Preview {
    ContentView()
}
