//
//  DailyHabitsView.swift
//  Kansei
//

import SwiftUI

struct DailyHabitsView: View {
    @State private var textInput: String = ""

    var body: some View {
        VStack (alignment: .leading){
            Text("Daily")
                .font(.system(size: 72, weight: .bold))
            Text("Habits")
                .font(.system(size: 72, weight: .bold))
            Text("a task to be completed everyday")
                .padding(.bottom, 30)
            HStack {
                Image(systemName: "plus.circle.fill")
                    .symbolRenderingMode(.monochrome)
                    .resizable()
                    .frame(width: 12, height: 12)
                TextField("Add habit", text: $textInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200)
            }
            .padding(.bottom, 20)
            TodoItem(title: "Make bed", checked: true)
            TodoItem(title: "Morning routine", checked: true)
            TodoItem(title: "1 leetcode", checked: true)
            TodoItem(title: "Pushups", checked: true)
            TodoItem(title: "Nighttime routine", checked: false)
            Spacer()
        }
    }
}

#Preview {
    DailyHabitsView()
}

struct Task: Identifiable {
    let id = UUID() 
    let title: String
    let iconName: String
}
