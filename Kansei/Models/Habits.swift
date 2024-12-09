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

func formatDate(_ date: Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd"
    return formatter.string(from: date)
}

func formatWeek(_ date: Date) -> String {
    let calendar = Calendar.current
    let year = calendar.component(.yearForWeekOfYear, from: date)
    let weekOfYear = calendar.component(.weekOfYear, from: date)
    return "\(year)-W\(String(format: "%02d", weekOfYear))"
}
