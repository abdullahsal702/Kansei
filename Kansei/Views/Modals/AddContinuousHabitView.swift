//
//  AddContinuousHabit.swift
//  Kansei
//

import SwiftUI

struct AddContinuousHabitView: View {
    var body: some View {
        VStack {
            HStack (alignment: .top) {
                Text("Add a Continuous Habit")
                    .font(.system(size: 56, weight: .bold))
                Image(systemName: "x.circle.fill")
                    .symbolRenderingMode(.monochrome)
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding(.top, 10)
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    AddContinuousHabitView()
}
