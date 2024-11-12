//
//  AnalyzeHabitView.swift
//  Kansei
//
//  Created by Abdullah Saleh on 11/11/24.
//

import SwiftUI

struct AnalyzeHabitView: View {
    var body: some View {
        VStack {
            HStack (alignment: .top) {
                Text("Analyze Your Habits")
                    .font(.system(size: 56, weight: .bold))
                Image(systemName: "x.circle.fill")
                    .symbolRenderingMode(.monochrome)
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding(.top, 10)
            }
            Spacer()
        }
        .padding()    }
}

#Preview {
    AnalyzeHabitView()
}
