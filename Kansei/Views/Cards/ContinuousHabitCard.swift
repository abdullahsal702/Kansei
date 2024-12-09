//
//  ContinuousHabitCard.swift
//  Kansei
//

import SwiftUI

struct ContinuousHabitCard: View {
    @EnvironmentObject var continuousHabitsViewModel: ContinuousHabitsViewModel
    
    var body: some View {
        NavigationLink(destination: ContinuousHabitsView()) {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(Color(hue: 0.558, saturation: 1.0, brightness: 1.0).gradient)
                .frame(height: 270)
                .padding(.trailing, 4) // why is this padding throwing things off?
                .overlay(VStack () {
                    HStack {
                        Text ("Continuous")
                            .bold()
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .padding(.bottom, 0)
                        Spacer()
                    }
                    ForEach(continuousHabitsViewModel.continuousHabits.prefix(2)) { habit in
                        let completed = habit.checkIns.filter {$0.completed}.count
                        let total = habit.checkIns.count
                        ContinuousHabitProgressBar(title: habit.title, completed: completed, total: total)
                    }
                    Spacer()
                })
        }
    }
}

#Preview {
    ContinuousHabitCard()
        .environmentObject(ContinuousHabitsViewModel())
}
