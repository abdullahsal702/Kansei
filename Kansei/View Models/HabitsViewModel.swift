//
//  HabitsViewModel.swift
//  Kansei
//
//

import Foundation

class HabitsViewModel: ObservableObject {
    
    @Published var dailyTasks: [TodoTask] = []
    @Published var weeklyTasks: [TodoTask] = []
    
    init() {
         getDailyTasks()
         getWeeklyTasks()
    }
    
    func getDailyTasks() {
        let newDailyTasks = [
            TodoTask(title: "Make bed", completed: false),
            TodoTask(title: "1 leetcode", completed: false),
        ]
        dailyTasks.append(contentsOf: newDailyTasks)
    }
    
    func getWeeklyTasks() {
        let newWeeklyTasks = [
            TodoTask(title: "Apply to 20 jobs", completed: false),
            TodoTask(title: "Gym 4x", completed: false),
        ]
        weeklyTasks.append(contentsOf: newWeeklyTasks)
    }
    
    
    func addDailyTask(title: String) {
        let newTask = TodoTask(title: title, completed: false)
        dailyTasks.append(newTask)
    }
    
    func deleteDailyTask(indexSet: IndexSet) {
        dailyTasks.remove(atOffsets: indexSet)
    }
    
    func moveDailyTask(from: IndexSet, to: Int) {
        dailyTasks.move(fromOffsets: from, toOffset: to)
    }
    
    func updateDailyTask(task: TodoTask) {
        if let index = dailyTasks.firstIndex(where: {$0.id == task.id}) {
            dailyTasks[index] = task.updateTask()
        }
    }
    
    func addWeeklyTask(title: String) {
        let newTask = TodoTask(title: title, completed: false)
        weeklyTasks.append(newTask)
    }
    
    func deleteWeeklyTask(indexSet: IndexSet) {
        weeklyTasks.remove(atOffsets: indexSet)
    }
    
    func moveWeeklyTask(from: IndexSet, to: Int) {
        weeklyTasks.move(fromOffsets: from, toOffset: to)
    }
    
    func updateWeeklyTask(task: TodoTask) {
        if let index = weeklyTasks.firstIndex(where: {$0.id == task.id}) {
            weeklyTasks[index] = task.updateTask()
        }
    }
    
}

