//
//  WeeklyHabitCard.swift
//  Kansei
//
//  Created by Abdullah Saleh on 11/10/24.
//

import SwiftUI

struct WeeklyHabitCard: View {
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
                            .padding()
                            .padding(.leading, 10)
                        Spacer()
                    }
                    VStack{
                        Image(systemName: "plus.circle.fill")
                            .symbolRenderingMode(.monochrome)
                            .resizable()
                            .frame(width: 22, height: 22)
                        Text("Add a weekly habit")
                            .fontWeight(.light)
                            .padding(.top, 4)
                    }
                    Spacer()
                })
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    WeeklyHabitCard()
}
