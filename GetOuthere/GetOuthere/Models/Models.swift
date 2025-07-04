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
        case "yellow": return .yellow
        case "green": return .green
        case "gray": return .gray
        default: return .indigo
        }
    }
}

struct DailyMood: Identifiable, Codable {
    var id = UUID()
    let mood: Mood
    let date: Date
}

struct Mission: Identifiable {
    let id = UUID()
    let text: String
    let points: Int
    let mood: Mood
}
