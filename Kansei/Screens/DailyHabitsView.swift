//
//  DailyHabitsView.swift
//  Kansei
//

import SwiftUI

struct DailyHabitsView: View {
    @EnvironmentObject var dailyHabitsViewModel: HabitsViewModel
    @State private var textInput: String = ""
    
    @Environment(\.editMode) private var editMode

    var body: some View {
        VStack (alignment: .leading){
            VStack (alignment: .leading){
                Text("Daily")
                    .font(.system(size: 72, weight: .bold))
                Text("Habits")
                    .font(.system(size: 72, weight: .bold))
                Text("a task to be completed everyday")
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
                    ForEach(dailyHabitsViewModel.dailyTasks) { task in
                        TodoItem(title: task.title, checked: task.completed)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    dailyHabitsViewModel.updateDailyTask(task: task)
                                }
                            }
                        }
                        .onMove(perform: dailyHabitsViewModel.moveDailyTask)
                        .onDelete(perform: dailyHabitsViewModel.deleteDailyTask)
                }
            }
           

            Spacer()
        }
    }
    
    private func addTask() {
        if textInput != "" {
            dailyHabitsViewModel.addDailyTask(title: textInput)
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
    DailyHabitsView()
        .environmentObject(HabitsViewModel())
}

struct Task: Identifiable {
    let id = UUID() 
    let title: String
    let iconName: String
}
