//
//  WeeklyHabitsView.swift
//  Kansei
//

import SwiftUI

struct WeeklyHabitsView: View {
    @State private var textInput: String = ""

    var body: some View {
        VStack (alignment: .leading){
            Text("Weekly")
                .font(.system(size: 72, weight: .bold))
            Text("Habits")
                .font(.system(size: 72, weight: .bold))
            Text("a task to be completed every week")
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
            TodoItem(title: "Apply to 20 jobs", checked: true)
            TodoItem(title: "Gym 4x", checked: false)
            Spacer()
        }
    }
}

#Preview {
    WeeklyHabitsView()
}
