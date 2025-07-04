import Foundation
import SwiftUI

@Observable final class GetOuthereStore {
    private let moodClient = MoodClientLive()
    
    // Mood's Data
    let moodData: [Mood] = Mood.allMoods
    var selectedMood: Mood? = nil
    var navigateToMissions: Bool = false
    let today = Calendar.current.startOfDay(for: Date())
    
    // Mission's Data
    var timeRemaining = ""
    
    //MARK: - App's Logic
    
    // Home
    func greeting() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 0..<6: return "Good Night,"
        case 6..<12: return "Good Morning,"
        case 12..<18: return "Good Afternoon,"
        default: return "Nice day,"
        }
    }
    
    func currentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: Date())
    }
    
    // Mood
    func createdDailyMood(_ mood: Mood) -> DailyMood {
        return DailyMood(mood: mood, date: today)
    }
    
    func savedDailyMood(_ mood: Mood) {
        selectedMood = mood
        let dailyMood = createdDailyMood(mood)
        moodClient.saveMood(dailyMood)
    }
    
    func loadedDailyMood() {
        let mood = moodClient.loadMood().mood
        selectedMood = mood
    }
    
    func cleanDailyMood() {
        
    }
    
    // Mission
    func timeRemainingForMissionEnds() {
        guard let midnight = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date().addingTimeInterval(86400)) else {
            timeRemaining = "Error"
            return
        }
        
        let remainingSeconds = Int(midnight.timeIntervalSince(Date()))
        let hours = remainingSeconds / 3600
        let minutes = (remainingSeconds % 3600) / 60
        let seconds = remainingSeconds % 60
        
        timeRemaining = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        
    }
}
