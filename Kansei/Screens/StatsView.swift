//
//  StatsView.swift
//  Kansei
//

import SwiftUI

struct StatsView: View {
    
    @EnvironmentObject var dailyHabitsViewModel: HabitsViewModel
    @EnvironmentObject var weeklyHabitsViewModel: HabitsViewModel
    @EnvironmentObject var continuousHabitsViewModel: HabitsViewModel
    
    @State private var isModalPresented = false
    @State private var userPrompt =  ""
    @State private var response: LocalizedStringKey = ""
    @State private var isLoading = false
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading){
                Text("Reflections")
                    .font(.system(size: 42, weight: .bold))
                    .padding(.bottom, 20)
                Text("Inspiration")
                    .font(.title)
                    .fontWeight(.bold)
                Button(action: {print(dailyHabitsViewModel.dailyTasks[0])}) {
                    Text("Find Inspiration")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.teal]),
                                           startPoint: .top,
                                           endPoint: .bottom)
                            .clipShape(Capsule())
                        )
                }
                Text("Insights")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 40)
                Text("Take a step back and assess your habits.")
                TextField("Ask anything about your habits...", text: $userPrompt, axis: .vertical)
                    .lineLimit(5)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                Button(action: {generateAIResponse()}) {
                    Text("Gain Insights")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.teal]),
                                           startPoint: .top,
                                           endPoint: .bottom)
                            .clipShape(Capsule())
                        )
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .disabled(userPrompt.isEmpty)
                .opacity(userPrompt.isEmpty ? 0.5 : 1.0)
                if isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        .scaleEffect(3)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                } else {
                    Text(response)
                        .padding()
                }

                Spacer()
            }
            .padding(20)
        }
    }
    
    func generateAIResponse() {
        isLoading = true
        guard let url = URL(string: "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=\(APIKey.default)") else {
            print("Invalid URL.")
            return
        }
        
        let requestBody: [String: Any] = [
            "contents": [
                [
                    "parts": [
                        ["text": "\(userPrompt)"]
                    ]
                ]
            ]
        ]

        guard let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) else {
            print("Error converting request body to JSON.")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Request error: \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200,
                  let data = data else {
                print("Invalid response or no data received.")
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let candidates = json["candidates"] as? [[String: Any]],
                   let content = candidates.first?["content"] as? [String: Any],
                   let parts = content["parts"] as? [[String: Any]],
                   let text = parts.first?["text"] as? String {
                    isLoading = false
                    self.response = LocalizedStringKey(text)
                } else {
                    print("Failed to parse JSON structure.")
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }

        task.resume()
    }
}

#Preview {
    StatsView()
        .environmentObject(HabitsViewModel())
        .environmentObject(ContinuousHabitsViewModel())
}
