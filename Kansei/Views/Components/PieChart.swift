//
//  PieChart.swift
//  Kansei
//
//

import SwiftUI
import Charts

struct PieChart: View {
    @EnvironmentObject var dailyHabitsViewModel: HabitsViewModel
    @EnvironmentObject var weeklyHabitsViewModel: HabitsViewModel
    @EnvironmentObject var continuousHabitsViewModel: ContinuousHabitsViewModel
    
    var body: some View {
        let dailyCompleted = dailyHabitsViewModel.completedDailyTasksCount()
        let weeklyCompleted = weeklyHabitsViewModel.completedWeeklyTasksCount()
        let continuousCompleted = continuousHabitsViewModel.completedCheckInsCount()
        let totalCompleted = dailyCompleted + weeklyCompleted + continuousCompleted
        let totalTasks = dailyHabitsViewModel.dailyTasks.count + weeklyHabitsViewModel.weeklyTasks.count + continuousHabitsViewModel.continuousHabits.reduce(0) { $0 + $1.checkIns.count }

        let chartData = [
            HabitChartData(value: totalCompleted, color: .green),
            HabitChartData(value: totalTasks - totalCompleted, color: .gray.opacity(0.25))
        ]

        Chart(chartData) { data in
            SectorMark(
                angle: .value("Count", data.value),
                innerRadius: .ratio(0.4)
            )
            .foregroundStyle(data.color)
        }
        .frame(width: 80, height: 80)
    }
}

struct HabitChartData: Identifiable {
    let id = UUID()
    let value: Int
    let color: Color
}

#Preview {
    PieChart()
        .environmentObject(HabitsViewModel())
        .environmentObject(ContinuousHabitsViewModel())
}
