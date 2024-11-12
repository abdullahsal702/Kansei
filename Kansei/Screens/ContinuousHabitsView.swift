//
//  ContinuousHabitsView.swift
//  Kansei
//
//

import SwiftUI

struct ContinuousHabitsView: View {
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
                // Spacer() // How do I make this behave like flex?
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
            
            // add lazy vstack here
            ContinuousHabitDetailsCard()
                .sheet(isPresented: $isModalPresented) {
                    AddContinuousHabitView()
                }
            Spacer()
        }
    }
}

#Preview {
    ContinuousHabitsView()
}
