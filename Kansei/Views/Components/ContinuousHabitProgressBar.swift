//
//  ContinuousHabitProgressBar.swift
//  Kansei
//

import SwiftUI

struct ContinuousHabitProgressBar: View {
    let title: String
    let completed: Int
    let total: Int
    
    var body: some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(Color.white)
            .frame(height: 60)
            .padding()
            .padding(.trailing, 12)
            .overlay(
                VStack (alignment: .leading ){
                    Text(title)
                        .font(.system(size: 16))
                        .foregroundColor(.blue)
                    Text("\(completed)/\(total) check-ins")
                        .font(.system(size: 12))
                        .foregroundColor(.blue)
                }.padding(.trailing, 36)
            )
    }
}

#Preview {
    ContinuousHabitProgressBar(title: "Drink Water", completed: 2, total: 3)
}
