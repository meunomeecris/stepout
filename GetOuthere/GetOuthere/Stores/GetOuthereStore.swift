import Foundation
import SwiftData
import SwiftUI

@Observable final class GetOuthereStore {
    private let now = Date()
    private let calendar = Calendar.current
    
    /// MoodPicker
    var selectedMood: Mood? = nil
    var navigateToMissions: Bool = false
    
    ///Mood Picker
    let today = Calendar.current.startOfDay(for: Date())
    
    /// Mission
    var timeRemaining = ""

    /// Home
    func greeting() -> String {
        let hour = calendar.component(.hour, from: now)
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
        return formatter.string(from: now)
    }
    
    /// Home - Mission
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
    
//    /// Missions
//    func showMission() -> Mission {
////        let mission = MissionData().getMission(for: <#Mood#>).text
////        return mission
//        
//        Mission
//        
//    }
}
