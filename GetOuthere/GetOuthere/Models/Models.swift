import Foundation
import SwiftUI

enum Mood: String, CaseIterable, Identifiable, Codable {
    case angry, sad, anxious, bored, tired, okay, happy, confidente, motivated
    
    var id: String { rawValue }
    
    var emoji: String {
        switch self {
        case .angry: "😡"
        case .sad: "😢"
        case .anxious: "😰"
        case .bored: "😐"
        case .tired: "😴"
        case .okay: "🙂"
        case .happy: "😄"
        case .confidente: "😏"
        case .motivated: "😉"
        }
    }
    
    var color: Color {
        switch self {
        case .angry: return Color(.red)
        case .sad: return Color(.blue)
        case .anxious: return Color(.blue)
        case .bored: return Color(.gray)
        case .tired: return Color(.gray)
        case .okay: return Color(.yellow)
        case .happy: return Color(.yellow)
        case .confidente: return Color(.green)
        case .motivated: return Color(.green)
        }
    }
}

struct Mission: Identifiable {
    let id = UUID()
    let text:  String
}
