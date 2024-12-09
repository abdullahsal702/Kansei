//
//  Habits.swift
//  Kansei
//
//

import Foundation

struct TodoTask: Identifiable, Codable {
    let id: UUID
    let title: String
    let completed: Bool
    
    init(id: UUID = UUID(), title: String, completed: Bool) {
        self.id = id
        self.title = title
        self.completed = completed
    }
    
    func updateTask() -> TodoTask {
        return TodoTask(id: id, title: title, completed: !completed)
    }
    
}

struct ContinuousTask: Identifiable, Codable {
    var id = UUID()
    var title: String
    var description: String
    var numCheckIns: Int
    var checkInStart: Date
    var checkInEnd: Date
    var checkIns: [TodoTask]
}

struct Tasks: Encodable {
    let dailyTasks: [TodoTask]
    let weeklyTasks: [TodoTask]
    let continuousHabits: [ContinuousTask]
}
