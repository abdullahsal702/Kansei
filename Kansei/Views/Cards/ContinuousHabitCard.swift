//
//  ContinuousHabitCard.swift
//  Kansei
//
//  Created by Abdullah Saleh on 11/10/24.
//

import SwiftUI

struct ContinuousHabitCard: View {
    var body: some View {
        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
            .fill(Color(hue: 0.558, saturation: 1.0, brightness: 1.0).gradient)
            .frame(height: 270)
            .padding(.trailing, 12)
            .overlay(VStack {
                HStack {
                    Text ("Continuous")
                        .bold()
                        .font(.title2)
                        .foregroundColor(.white)
                        .padding()
                    Spacer()
                }
                Spacer()
            })
    }
}

#Preview {
    ContinuousHabitCard()
}
