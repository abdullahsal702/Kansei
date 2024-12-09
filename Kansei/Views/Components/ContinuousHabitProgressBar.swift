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
        ZStack(alignment: .leading) {
            GeometryReader { geometry in
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 60)
                
                RoundedRectangle(cornerRadius: 6)
                    .fill(Color.blue)
                    .frame(width: progressWidth(parentWidth: geometry.size.width), height: 60)
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.white)
                    Text("\(completed)/\(total) check-ins")
                        .font(.system(size: 12))
                        .foregroundColor(.white)
                }
                .padding(.top, 10)
                .padding(.leading, 10)
            }
        }
        .frame(height: 60)
        .padding(.leading, 10)
        .padding(.trailing, 20)
    }

    private func progressWidth(parentWidth: CGFloat) -> CGFloat {
        guard total > 0 else { return 0 }
        let progress = CGFloat(completed) / CGFloat(total)
        return progress * parentWidth
    }
}

#Preview {
    ContinuousHabitProgressBar(title: "Drink Water", completed: 2, total: 3)
}
