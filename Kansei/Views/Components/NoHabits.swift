//
//  NoHabits.swift
//  Kansei
//
//  Created by Abdullah Saleh on 11/18/24.
//

import SwiftUI

struct NoHabits: View {
    let type: String
    
    var body: some View {
        VStack{
            Image(systemName: "plus.circle.fill")
                .symbolRenderingMode(.monochrome)
                .resizable()
                .frame(width: 22, height: 22)
            Text("Add a \(type) habit")
                .fontWeight(.light)
                .padding(.top, 4)
        }
    }
}

#Preview {
    NoHabits(type: "Daily")
}
