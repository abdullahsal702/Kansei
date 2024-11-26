//
//  AddContinuousHabit.swift
//  Kansei
//

import SwiftUI

struct AddContinuousHabitView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var continuousHabitsViewModel: ContinuousHabitsViewModel

    @State private var titleInput: String = ""
    @State private var descriptionInput: String = ""
    @State private var numCheckIns: Int = 3
    @State private var checkInStart = presetTime(hour: 10, minute: 0)
    @State private var checkInEnd = presetTime(hour: 20, minute: 0)
    
    static func presetTime(hour: Int, minute: Int) -> Date {
        var components = Calendar.current.dateComponents([.year, .month, .day], from: Date())
        components.hour = hour
        components.minute = minute
        return Calendar.current.date(from: components) ?? Date()
    }

    var body: some View {
        VStack {
            HStack (alignment: .top) {
                Text("Add a Continuous Habit")
                    .font(.system(size: 56, weight: .bold))
                Image(systemName: "x.circle.fill")
                    .symbolRenderingMode(.monochrome)
                    .resizable()
                    .frame(width: 32, height: 32)
                    .padding(.top, 10)
                    .onTapGesture(perform: {dismiss()})
            }
            VStack(alignment: .leading, spacing: 20) {
                    
                TextField("Habit Name", text: $titleInput)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    
                Text("Add a descripton")
                    .padding(.leading, 10)
                TextEditor(text: $descriptionInput)
                    .frame(height: 100)
                    .padding(4)
                    .background(Color.gray.opacity(0.3))
                    .cornerRadius(10)
                HStack (alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                    TextField("", value: $numCheckIns, format: .number)
                        .keyboardType(.numberPad)
                        .padding()
                        .frame(width: 50)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                    Text("check-ins")
                }
                .padding(.leading, 10)
                HStack(alignment: .center) {
                    Text("Between")
                    DatePicker(
                        "",
                        selection: $checkInStart,
                        displayedComponents: .hourAndMinute
                    )
                    .labelsHidden()
                    Text("and")
                    DatePicker(
                        "",
                        selection: $checkInEnd,
                        displayedComponents: .hourAndMinute
                    )
                    .labelsHidden()
                }
            }
            Spacer()
            Button(action: {
                continuousHabitsViewModel.createContinuousHabit(title: titleInput, description: descriptionInput, numCheckIns: numCheckIns, checkInStart: checkInStart, checkInEnd: checkInEnd)
                dismiss()
            }) {
                Text("Create")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.gray)
                    )
            }
            .padding(.bottom, 40)
        }
        .padding()
    }
}

#Preview {
    AddContinuousHabitView()
        .environmentObject(ContinuousHabitsViewModel())
}
