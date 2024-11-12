//
//  DailyHabitCard.swift
//  Kansei
//

import SwiftUI

struct DailyHabitCard: View {
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
                        TodoItem(title: "Make bed", checked: true)
                        TodoItem(title: "Morning routine", checked: true)
                        TodoItem(title: "1 leetcode", checked: true)
                        TodoItem(title: "Pushups", checked: true)
                        TodoItem(title: "Nighttime routine", checked: false)
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
}
