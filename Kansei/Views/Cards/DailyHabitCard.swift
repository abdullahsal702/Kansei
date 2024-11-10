//
//  DailyHabitCard.swift
//  Kansei
//
//  Created by Abdullah Saleh on 11/10/24.
//

import SwiftUI

struct DailyHabitCard: View {
    var body: some View {
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
                    HStack (alignment: .firstTextBaseline) {
                        Image(systemName: "square.fill")
                            .symbolRenderingMode(.monochrome)
                            .resizable()
                            .frame(width: 12, height: 12)
                        Text("Make bed")
                    }
                    HStack (alignment: .firstTextBaseline) {
                        Image(systemName: "square.fill")
                            .symbolRenderingMode(.monochrome)
                            .resizable()
                            .frame(width: 12, height: 12)
                        Text("Morning routine")
                    }
                    HStack (alignment: .firstTextBaseline) {
                        Image(systemName: "square.fill")
                            .symbolRenderingMode(.monochrome)
                            .resizable()
                            .frame(width: 12, height: 12)
                        Text("1 leetcode")
                    }
                    HStack (alignment: .firstTextBaseline) {
                        Image(systemName: "square.fill")
                            .symbolRenderingMode(.monochrome)
                            .resizable()
                            .frame(width: 12, height: 12)
                        Text("Pushups")
                    }
                    HStack (alignment: .firstTextBaseline) {
                        Image(systemName: "square")
                            .symbolRenderingMode(.monochrome)
                            .resizable()
                            .frame(width: 12, height: 12)
                        Text("Nighttime routine")
                    }
                }
                .padding(.leading, 24)
                .padding(.trailing, 20)
                Spacer()
            })
            
    }
}

#Preview {
    DailyHabitCard()
}
