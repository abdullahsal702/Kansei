//
//  ContinuousHabitsView.swift
//  Kansei
//
//

import SwiftUI

struct ContinuousHabitsView: View {
    @EnvironmentObject var continuousHabitsViewModel: ContinuousHabitsViewModel

    @State private var isModalPresented = false
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Continuous")
                .font(.system(size: 56, weight: .bold))
            Text("Habits")
                .font(.system(size: 56, weight: .bold))
            Text("consistent action throughout the day")
                .padding(.bottom, 30)
            HStack {
                Image(systemName: "plus.circle.fill")
                    .symbolRenderingMode(.monochrome)
                    .resizable()
                    .frame(width: 16, height: 16)
                Text("Add Habit")
                    .bold()
                    .font(.title3)
            }
            .onTapGesture {
                isModalPresented = true
            }
            .padding(.bottom)
            
            ScrollView {
                LazyVStack {
                    ForEach(continuousHabitsViewModel.continuousHabits) { habit in
                        ContinuousHabitDetailsCard(habit: habit)
                    }
                }
            }
            Spacer()
        }
        .sheet(isPresented: $isModalPresented) {
            AddContinuousHabitView()
        }
        .padding(26)
    }
}

#Preview {
    ContinuousHabitsView()
        .environmentObject(ContinuousHabitsViewModel())
}
