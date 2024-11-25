//
//  WeeklyHabitCard.swift
//  Kansei
//
//

import SwiftUI

struct WeeklyHabitCard: View {
    
    @EnvironmentObject var weeklyHabitsViewModel: HabitsViewModel
    
    var body: some View {
        NavigationLink(destination: WeeklyHabitsView()) {
            RoundedRectangle(cornerRadius: 25.0)
                .fill(Color(hue: 0.799, saturation: 1.0, brightness: 0.751).gradient)
                .frame(height: 150)
                .padding(.leading, 8)
                .overlay(VStack {
                    HStack {
                        Text ("Weekly")
                            .bold()
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.top, 16)
                            .padding(.leading, 30)
                        Spacer()
                    }
                    VStack (alignment: .leading){
                        if weeklyHabitsViewModel.weeklyTasks.count > 0 {
                            ForEach(weeklyHabitsViewModel.weeklyTasks) { task in
                                // Shouldn't need an HStack here, fix later
                                HStack {
                                    TodoItem(title: task.title, checked: task.completed)
                                        .onTapGesture {
                                            withAnimation(.linear) {
                                                weeklyHabitsViewModel.updateWeeklyTask(task: task)
                                            }
                                        }
                                    Spacer()
                                }
                                .padding(.leading, 30)
                            }
                        } else {
                            NoHabits(type: "weekly")
                        }
                    }
                    Spacer()
                })
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    WeeklyHabitCard()
        .environmentObject(HabitsViewModel())
}
