import Foundation
import SwiftUI

@Observable final class GetOuthereStore {
    private let now = Date()
    private let calendar = Calendar.current
    
    var timeRemaining = ""
    var moodColor: Color = .yellow
    var selectedMood: Mood? = nil
    
    var navigateToMissions: Bool = false
    var navigateToChallenges: Bool = false
    
    
    func showMission() -> String {
        let mission = MissionData().getMission().text
        return mission
    }
    
    func currentDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: now)
    }
    
    func greeting() -> String {
        let hour = calendar.component(.hour, from: now)
        switch hour {
        case 0..<6: return "Good Night,"
        case 6..<12: return "Good Morning,"
        case 12..<18: return "Good Afternoon,"
        default: return "Nice day,"
        }
    }
    
    func timeRemainingForMissionEnds() {
        guard let midnight = calendar.date(bySettingHour: 0, minute: 0, second: 0, of: now.addingTimeInterval(86400)) else {
            timeRemaining = "Error"
            return
        }
        
        let remainingSeconds = Int(midnight.timeIntervalSince(now))
        let hours = remainingSeconds / 3600
        let minutes = (remainingSeconds % 3600) / 60
        let seconds = remainingSeconds % 60
        
        timeRemaining = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
        
    }
}
