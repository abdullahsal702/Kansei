//
//  HomeView.swift
//  Kansei
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color(hue: 1.0, saturation: 0.0, brightness: 0.1)
                    .ignoresSafeArea()
                VStack (spacing: 16){
                    GreetingTitle()
                    HStack (alignment: .top, spacing: 16) {
                        DailyHabitCard()
                        VStack {
                            ContinuousHabitCard()
                            Text("Total")
                                .bold()
                                .font(.title2)
                                .padding()
                                .padding(.trailing)
                        }
                    }
                    WeeklyHabitCard()
                }
            }
        }
    }
}

struct GreetingTitle: View {
    
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
        }
    }
}

#Preview {
    HomeView()
        .environmentObject(HabitsViewModel())
        .environmentObject(ContinuousHabitsViewModel())
}
