import Foundation

enum Mood: String, CaseIterable, Identifiable {
    case sad, anxious, bored, tired, okay, happy, motivated, unmotivated, angry
    
    var id: String { rawValue }
    
    var emoji: String {
        switch self {
        case .sad: "😢"
        case .anxious: "😰"
        case .bored: "😐"
        case .tired: "😴"
        case .okay: "🙂"
        case .happy: "😄"
        case .motivated: "😉"
        case .unmotivated: "🫠"
        case .angry: "😡"
        }
    }
}


struct Mission: Identifiable {
    let id = UUID()
    let text:  String
}
