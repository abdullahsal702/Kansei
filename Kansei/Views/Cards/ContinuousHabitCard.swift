//
//  ContinuousHabitCard.swift
//  Kansei
//

import SwiftUI

struct ContinuousHabitCard: View {
    var body: some View {
        NavigationLink(destination: ContinuousHabitsView()) {
            RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                .fill(Color(hue: 0.558, saturation: 1.0, brightness: 1.0).gradient)
                .frame(height: 270)
                .padding(.trailing, 12) // why is this padding throwing things off?
                .overlay(VStack {
                    HStack {
                        Text ("Continuous")
                            .bold()
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding()
                            .padding(.bottom, 0)
                        Spacer()
                    }
                    ContinuousHabit()
                    Spacer()
                })
        }
    }
}

#Preview {
    ContinuousHabitCard()
}

struct ContinuousHabit: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 6)
            .fill(Color.white)
            .frame(height: 60)
            .padding()
            .padding(.trailing, 12)
            .overlay(
                VStack (alignment: .leading ){
                    Text("Fix Posture")
                        .font(.system(size: 16))
                    Text("2/3 check-ins")
                        .font(.system(size: 12))
                }
            )

    }
}
