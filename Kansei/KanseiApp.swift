//
//  KanseiApp.swift
//  Kansei
//

import SwiftUI

@main
struct KanseiApp: App {
    @StateObject private var habitsViewModel = HabitsViewModel()
    @StateObject private var continuousHabitsViewModel = ContinuousHabitsViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(habitsViewModel)
                .environmentObject(continuousHabitsViewModel)
        }
    }
}
