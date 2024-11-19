//
//  WeeklyHabitsView.swift
//  Kansei
//

import SwiftUI

struct WeeklyHabitsView: View {
    @EnvironmentObject var weeklyHabitsViewModel: HabitsViewModel
    @State private var textInput: String = ""
    
    @Environment(\.editMode) private var editMode

    var body: some View {
        VStack (alignment: .leading){
            VStack(alignment: .leading) {
                Text("Weekly")
                    .font(.system(size: 72, weight: .bold))
                Text("Habits")
                    .font(.system(size: 72, weight: .bold))
                Text("a task to be completed every week")
                    .padding(.bottom, 30)
            }
            .padding(20)
            .padding(.leading, 40)
            HStack {
                Image(systemName: "plus.circle.fill")
                    .symbolRenderingMode(.monochrome)
                    .resizable()
                    .frame(width: 12, height: 12)
                    .onTapGesture(perform: addTask)
                TextField("Add habit", text: $textInput)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: 200)
            }
            .padding()
            .padding(.leading, 40)
            VStack (alignment: .trailing) {
                Button(action: toggleEditMode) {
                    Image(systemName: editMode?.wrappedValue == .active ? "checkmark" : "pencil")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .foregroundColor(.primary)
                }
                .padding(.trailing, 20)
                List {
                    ForEach(weeklyHabitsViewModel.weeklyTasks) { task in
                        TodoItem(title: task.title, checked: task.completed)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    weeklyHabitsViewModel.updateWeeklyTask(task: task)
                                }
                            }
                        }
                        .onMove(perform: weeklyHabitsViewModel.moveWeeklyTask)
                        .onDelete(perform: weeklyHabitsViewModel.deleteWeeklyTask)
                }
            }
            Spacer()
        }
    }
    
    private func addTask() {
        if textInput != "" {
            weeklyHabitsViewModel.addWeeklyTask(title: textInput)
        }
    }
    
    private func toggleEditMode() {
        withAnimation {
            if editMode?.wrappedValue == .active {
                editMode?.wrappedValue = .inactive
            } else {
                editMode?.wrappedValue = .active
            }
        }
    }
}

#Preview {
    WeeklyHabitsView()
        .environmentObject(HabitsViewModel())
}
