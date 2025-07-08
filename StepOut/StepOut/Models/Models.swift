import Foundation
import SwiftUI

struct Mood: Identifiable, Codable, Hashable {
    let id: String
    let emoji: String
    let colorName: String 
    
    var color: Color {
        switch colorName {
        case "red": return .red
        case "blue": return .blue
        case "brown": return .brown
        case "yellow": return .yellow
        case "green": return .green
        default: return .indigo
        }
    }
}

struct DailyMood: Identifiable, Codable {
    var id = UUID()
    let mood: Mood
    let date: Date
}

struct Mission: Identifiable, Codable {
    var id = UUID()
    let text: String
    let point: Int
    let moodID: String
    var completed: Bool
    var date: Date
}

struct Tracker: Codable {
    var completed: Int
    var point: Int
    var streak: Int
    var date: Date
}

enum AppFlowState: Codable {
    case login
    case home
}
