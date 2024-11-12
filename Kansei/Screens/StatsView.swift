//
//  StatsView.swift
//  Kansei
//

import SwiftUI

struct StatsView: View {
    @State private var isModalPresented = false
    
    var body: some View {
        VStack (alignment: .leading){
            Text("Your insights")
                .font(.system(size: 42, weight: .bold))
                .padding(.bottom, 20)
            Text("All Habits")
                .bold()
                .font(.title3)
                .padding(.bottom, 4)
                .padding(.leading, 10)
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 200)
                .padding(.bottom, 20)
            Text("Continuous")
                .bold()
                .font(.title3)
                .padding(.bottom, 4)
                .padding(.leading, 10)
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 200)
                .padding(.bottom, 20)
            Button(action: {
                isModalPresented = true
            }) {
                Text("Analyze")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.gray)
                            .frame(width: 100)
                    )
            }
            Spacer()
        }
        .padding(20)
        .sheet(isPresented: $isModalPresented) {
            AnalyzeHabitView()
        }
    }
}

#Preview {
    StatsView()
}
