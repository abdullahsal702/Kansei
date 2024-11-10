//
//  ContentView.swift
//  Kansei
//
//  Created by Abdullah Saleh on 11/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(hue: 1.0, saturation: 0.0, brightness: 0.1)
                    .ignoresSafeArea()
                VStack (spacing: 16){
                    GreetingTitle()
                    HStack (alignment: .top, spacing: 16) {
                        DailyHabitCard()
                        VStack {
                            ContinuousHabitCard()
                        }
                    }
                    WeeklyHabitCard()
                }
                .toolbar{
                    ToolbarItemGroup(placement: .bottomBar) {
                        Button(action: {
                            print("Pressed Home")
                        }) {
                            VStack {
                                Image(systemName: "house.fill")
                                Text("Home")
                            }
                        }
                        Button(action: {
                            print("Pressed Stats")
                        }) {
                            VStack {
                                Image(systemName: "chart.bar.fill")
                                Text("Stats")
                            }
                        }
                    }
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
    ContentView()
}
