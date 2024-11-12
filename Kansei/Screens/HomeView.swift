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
    var body: some View {
        HStack {
            Text("Good morning")
                .font(.largeTitle)
                .bold()
                .padding(.leading, 20)
            Spacer()
        }
    }
}

#Preview {
    HomeView()
}
