//
//  AddContinuousHabit.swift
//  Kansei
//

import SwiftUI

struct AddContinuousHabitView: View {
    @Environment(\.dismiss) var dismiss
    @State private var titleInput: String = ""
    @State private var descriptionInput: String = ""


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
            VStack() {
                ZStack(alignment: .leading) {
                    if titleInput.isEmpty {
                        Text("Name")
                            .foregroundColor(.gray)
                            .padding(.leading, 18)
                    }

                    TextField("", text: $titleInput)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                .padding()
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    AddContinuousHabitView()
}
