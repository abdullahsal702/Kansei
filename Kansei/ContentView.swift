//
//  ContentView.swift
//  Kansei
//

import SwiftUI

struct ContentView: View {
    @AppStorage("streakCount") private var streakCount = 1
    @AppStorage("lastActiveDate") private var lastActiveDate: String = ""
    
    var body: some View {
        TabView {
            HomeView(streakCount: streakCount)
                .tabItem { Image(systemName: "house").padding(.top, 10) }
            StatsView()
                .tabItem { Image(systemName: "sparkles").padding(.top, 10) }
        }
        .onAppear {
            updateStreak()
        }
    }
    
    private func updateStreak() {
        let today = getCurrentDate()
        
        if lastActiveDate.isEmpty || lastActiveDate != today {
            if isConsecutiveDay(previousDate: lastActiveDate, currentDate: today) {
                streakCount += 1
            } else {
                streakCount = 1
            }
            lastActiveDate = today
        }
    }
    
    private func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: Date())
    }
    
    private func isConsecutiveDay(previousDate: String, currentDate: String) -> Bool {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let previous = dateFormatter.date(from: previousDate),
              let current = dateFormatter.date(from: currentDate) else {
            return false
        }
        
        let calendar = Calendar.current
        return calendar.isDate(current, inSameDayAs: calendar.date(byAdding: .day, value: 1, to: previous)!)
    }
        
}

#Preview {
    ContentView()
        .environmentObject(HabitsViewModel())
        .environmentObject(ContinuousHabitsViewModel())
}
