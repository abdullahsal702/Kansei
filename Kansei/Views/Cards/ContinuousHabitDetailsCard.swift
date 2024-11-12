//
//  ContinuousHabitDetailsCard.swift
//  Kansei
//

import SwiftUI

struct ContinuousHabitDetailsCard: View {
    var body: some View {
        VStack (alignment: .leading) {
            HStack{
                Text("Fix Posture")
                    .bold()
                    .font(.title)
                Image(systemName: "pencil")
            }
            .padding(.bottom, 2)
            Text("Bring attention to your neck and shoulders. Stop slouching")
                .padding(.bottom, 4)
            Text("3 check-ins from 10am-3pm")
                .padding(.bottom, 12)
            TodoItem(title: "11am check-in", checked: true)
            TodoItem(title: "12:42pm check-in", checked: true)
            TodoItem(title: "2pm check-in", checked: false)

            
        }
        .padding()
        .border(Color.white, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)

    }
}

#Preview {
    ContinuousHabitDetailsCard()
}
