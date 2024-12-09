//
//  HomeView.swift
//  Kansei
//

import SwiftUI

struct HomeView: View {
    let streakCount: Int
    
    @EnvironmentObject var dailyHabitsViewModel: HabitsViewModel
    @EnvironmentObject var weeklyHabitsViewModel: HabitsViewModel
    @EnvironmentObject var continuousHabitsViewModel: ContinuousHabitsViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hue: 1.0, saturation: 0.0, brightness: 0.1)
                    .ignoresSafeArea()
                VStack (spacing: 16){
                    GreetingTitle(streakCount: streakCount)
                    HStack (alignment: .top, spacing: 16) {
                        DailyHabitCard()
                        VStack {
                            ContinuousHabitCard()
                            Text("Total")
                                .foregroundColor(.white)
                                .bold()
                                .font(.title2)
                                .padding(8)
                                .padding(.trailing)
                            PieChart()
                                .offset(y: -8)
                                .padding(.trailing, 4)
                        }
                    }
                    WeeklyHabitCard()
                }
            }
        }
    }
}

struct GreetingTitle: View {
    
    let streakCount: Int
    
    private var greeting: String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 6..<12:
            return "Good morning"
        case 12..<18:
            return "Good afternoon"
        default:
            return "Good evening"
        }
    }
    
    var body: some View {
        HStack {
            Text(greeting)
                .font(.largeTitle)
                .foregroundColor(.white)
                .bold()
                .padding(.leading, 20)
            Spacer()
            Text(String(streakCount))
                .font(.title)
                .foregroundColor(.white)
                .bold()
            Image(systemName: "flame.fill")
                .foregroundColor(.red)
                .font(.system(size: 22))
                .padding(.trailing, 12)
                .offset(x: -4)
        }
    }
}

#Preview {
    HomeView(streakCount: 4)
        .environmentObject(HabitsViewModel())
        .environmentObject(ContinuousHabitsViewModel())
}
