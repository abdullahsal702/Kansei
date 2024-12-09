//
//  TodoItem.swift
//  Kansei
//

import SwiftUI

struct TodoItem: View {
        let title: String
        let checked: Bool

        var body: some View {
            HStack(alignment: .firstTextBaseline) {
                Image(systemName: checked ? "square.fill" : "square")
                    .symbolRenderingMode(.monochrome)
                    .resizable()
                    .frame(width: 12, height: 12)
                Text(title)
                    .foregroundColor(.white)
            }
        }
}

#Preview {
    TodoItem(title: "Do my homework", checked: false)
}
