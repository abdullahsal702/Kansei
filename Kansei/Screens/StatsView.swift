//
//  StatsView.swift
//  Kansei
//

import SwiftUI

struct StatsView: View {
    
    @EnvironmentObject var dailyHabitsViewModel: HabitsViewModel
    @EnvironmentObject var weeklyHabitsViewModel: HabitsViewModel
    @EnvironmentObject var continuousHabitsViewModel: ContinuousHabitsViewModel
    
    @State private var userPrompt =  ""
    @State private var response: LocalizedStringKey = ""
    @State private var isAILoading = false
    
    @State private var quote: LocalizedStringKey = ""
    @State private var isQuoteLoading = false
    
    var body: some View {
        ScrollView {
            VStack (alignment: .leading){
                Text("Reflections")
                    .font(.system(size: 42, weight: .bold))
                    .padding(.bottom, 20)
                Text("Inspiration")
                    .font(.title)
                    .fontWeight(.bold)
                Button(action: {fetchQuote()}) {
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
                if isQuoteLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .teal))
                        .scaleEffect(2)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding()
                } else {
                    Text(quote)
                        .padding()
                }
                Text("Insights")
                    .font(.title)
                    .fontWeight(.bold)
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
                if isAILoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .teal))
                        .scaleEffect(2)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.top, 40)
                } else {
                    Text(response)
                        .padding()
                }

                Spacer()
            }
            .padding(20)
        }
    }
    
    func fetchQuote() {
        isQuoteLoading = true

        guard let url = URL(string: "https://zenquotes.io/api/random") else {
            print("The URL isn't valid")
            isQuoteLoading = false
            return
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error with the req: \(error)")
                isQuoteLoading = false
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200,
                  let data = data else {
                print("Error with response")
                isQuoteLoading = false
                return
            }

            do {
                if let quotes = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]],
                   let firstQuote = quotes.first,
                   let quoteText = firstQuote["q"] as? String,
                   let author = firstQuote["a"] as? String {
                    isQuoteLoading = false
                    quote = LocalizedStringKey("\"\(quoteText)\" - \(author)")
                } else {
                    print("Error parsing the JSON")
                    isQuoteLoading = false
                }
            } catch {
                print("Error parsing JSON: \(error)")
                isQuoteLoading = false
            }
        }

        task.resume()
    }
    
    func tasksToJSONString() -> String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted

        let tasks = Tasks(
            dailyTasks: dailyHabitsViewModel.dailyTasks,
            weeklyTasks: weeklyHabitsViewModel.weeklyTasks,
            continuousHabits: continuousHabitsViewModel.continuousHabits
        )
        do {
            let jsonData = try encoder.encode(tasks)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                return jsonString
            } else {
                return "Error converting JSON"
            }
        } catch {
            return "Error encoding the tasks: \(error.localizedDescription)"
        }
    }
    
    func generateAIResponse() {
        isAILoading = true
        guard let url = URL(string: "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=\(APIKey.default)") else {
            print("Invalid URL.")
            return
        }
        
        let prompt = "\(userPrompt)\nAssume the role of a life coach. Answer in a helpful tone in relation to this data about myself. Don't use any bullet points in your answer. Use paragraphs instead. You can use bold titles to section paragraphs.\n\(tasksToJSONString())"
        
        let requestBody: [String: Any] = [
            "contents": [
                [
                    "parts": [
                        ["text": prompt]
                    ]
                ]
            ]
        ]

        guard let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) else {
            print("Error converting to JSON")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error with req: \(error)")
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200,
                  let data = data else {
                print("Error with response")
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let candidates = json["candidates"] as? [[String: Any]],
                   let content = candidates.first?["content"] as? [String: Any],
                   let parts = content["parts"] as? [[String: Any]],
                   let text = parts.first?["text"] as? String {
                    isAILoading = false
                    self.response = LocalizedStringKey(text)
                } else {
                    print("Error parsing JSON")
                }
            } catch {
                print("Error parsing JSON: \(error)")
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
