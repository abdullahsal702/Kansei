//
//  ContinuousHabitDetailsCard.swift
//  Kansei
//

import SwiftUI

struct ContinuousHabitDetailsCard: View {
    @EnvironmentObject var continuousHabitsViewModel: ContinuousHabitsViewModel

    let columns = [GridItem(.flexible()), GridItem(.flexible())]
//    let title: String
//    let description: String
//    let numCheckIns: Int
//    let checkInStart: Date
//    let checkInEnd: Date
//    let checkIns: [TodoTask]
    let habit: ContinuousTask
    let continuousHabits = [ TodoItem(title: "11am check-in", checked: true), TodoItem(title: "12:42pm check-in", checked: true), TodoItem(title: "2pm check-in", checked: false) ]
    
    private func formatTime(time: Date) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter.string(from: time)
    }
    
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack{
                Text(habit.title)
                    .bold()
                    .font(.title)
                Image(systemName: "pencil")
            }
            .padding(.bottom, 2)
            Text(habit.description)
                .padding(.bottom, 4)
            Text("\(habit.numCheckIns) check-ins from \(formatTime(time: habit.checkInStart))-\(formatTime(time: habit.checkInEnd))")
                .padding(.bottom, 12)
            LazyVGrid (columns: columns) {
                ForEach(habit.checkIns) { checkIn in
                    TodoItem(title: checkIn.title, checked: checkIn.completed)
                    .onTapGesture {
                        withAnimation(.linear) {
                            continuousHabitsViewModel.updateCheckIn(habit: habit, checkIn: checkIn)
                        }
                    }
                }
            }
        }
        .padding()
        .border(Color.white, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)

    }
}

#Preview {
    ContinuousHabitDetailsCard(habit: ContinuousTask(title: "Drink Water", description: "I gotta drink more water everday", numCheckIns: 3, checkInStart: Calendar.current.date(bySettingHour: 10, minute: 0, second: 0, of: Date())!, checkInEnd: Calendar.current.date(bySettingHour: 20, minute: 0, second: 0, of: Date())!, checkIns: [TodoTask(title: "11:16 AM", completed: false), TodoTask(title: "2:36 PM", completed: false), TodoTask(title: "6:40 PM", completed: false)]))
        .environmentObject(ContinuousHabitsViewModel())

}
