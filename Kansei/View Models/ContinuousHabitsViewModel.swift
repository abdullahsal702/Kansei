//
//  ContinuousHabitsViewModel.swift
//  Kansei
//
//

import Foundation

class ContinuousHabitsViewModel: ObservableObject {
    @Published var continuousHabits: [ContinuousTask] = []
    
    init() {
        let newContinuousHabit = ContinuousTask(title: "Drink Water", description: "I gotta drink more water everday", numCheckIns: 3, checkInStart: Calendar.current.date(bySettingHour: 10, minute: 0, second: 0, of: Date())!, checkInEnd: Calendar.current.date(bySettingHour: 20, minute: 0, second: 0, of: Date())!, checkIns: [TodoTask(title: "11:17 AM", completed: false), TodoTask(title: "2:36 PM", completed: false), TodoTask(title: "6:40 PM", completed: false)])
        continuousHabits.append(newContinuousHabit)
    }
    
    func createContinuousHabit(title: String, description: String, numCheckIns: Int, checkInStart: Date, checkInEnd: Date) {
        let checkInTimes = generateRandomCheckIns(startTime: checkInStart, endTime: checkInEnd, count: numCheckIns)
        let checkIns = checkInTimes.map {time in
            return TodoTask(title: time, completed: false)
        }
//        print(checkInTimes)
        continuousHabits.append(ContinuousTask(title: title, description: description, numCheckIns: numCheckIns, checkInStart: checkInStart, checkInEnd: checkInEnd, checkIns: checkIns))
    }

    func updateCheckIn(habit: ContinuousTask, checkIn: TodoTask) {
        if let habitIndex = continuousHabits.firstIndex(where: {$0.id == habit.id}) {
            if let checkInIndex = continuousHabits[habitIndex].checkIns.firstIndex(where: {$0.id == checkIn.id}) {
                continuousHabits[habitIndex].checkIns[checkInIndex] = checkIn.updateTask()
            }
        }
    }

    
    func generateRandomCheckIns(startTime: Date, endTime: Date, count: Int) -> [String] {
        guard count > 0 else { return [] }
        
        let interval = endTime.timeIntervalSince(startTime)
        let segmentDuration = interval / Double(count)
        
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        
        return (0..<count).map { i in
            let segmentStart = startTime.addingTimeInterval(segmentDuration * Double(i))
            let randomOffset = TimeInterval.random(in: 0..<segmentDuration)
            let randomCheckIn = segmentStart.addingTimeInterval(randomOffset)
            return formatter.string(from: randomCheckIn)
        }
        .sorted()
    }
    
    func deleteContinuousHabit(by id: UUID) {
        if let index = continuousHabits.firstIndex(where: { $0.id == id }) {
            continuousHabits.remove(at: index)
        }
    }
    
    func completedCheckInsCount() -> Int {
        continuousHabits.reduce(0) { $0 + $1.checkIns.filter { $0.completed }.count }
    }
    
}

