//
//  DailyHabitCard.swift
//  Kansei
//

import SwiftUI

struct DailyHabitCard: View {
    
    @EnvironmentObject var dailyHabitsViewModel: HabitsViewModel
    
    var body: some View {
        NavigationLink(destination: DailyHabitsView()) {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(Color(hue: 0.099, saturation: 1.0, brightness: 1.0).gradient)
                .frame(height: 420)
                .padding(.leading,10)
                .overlay(VStack (alignment: .leading) {
                    HStack {
                        Text ("Daily")
                            .bold()
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .padding(.leading, 12)
                        Spacer()
                    }
                    VStack (alignment: .leading){
                        if dailyHabitsViewModel.dailyTasks.count > 0 {
                            ForEach(dailyHabitsViewModel.dailyTasks) { task in
                                TodoItem(title: task.title, checked: task.completed)
                                    .onTapGesture {
                                        withAnimation(.linear) {
                                            dailyHabitsViewModel.updateDailyTask(task: task)
                                        }
                                    }
                            }
                        } else {
                            NoHabits(type: "daily")
                                .padding(.leading, 12)
                                .padding(.top, 20)
                        }
                    }
                    .padding(.leading, 24)
                    .padding(.trailing, 20)
                    Spacer()
                })
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    DailyHabitCard()
        .environmentObject(HabitsViewModel())
}
