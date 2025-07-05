import Foundation
import SwiftUI

@Observable final class GetOuthereStore {
    private let moodClient = MoodClientLive()
    private let missionClient = MissionClientLive()
    private let trackerClient = TrackerClientLive()
    
    
    // Home's Data
    var username = "Human"
    
    // Mood's Data
    let moodData: [Mood] = Mood.allMoods
    var dailyMood: Mood? = nil
    var navigateToMissions: Bool = false
    var showGetMissionButton: Bool = false
    
    // Mission's Data
    let missionData: [Mission] = Mission.allMissions
    var dailyMission: Mission? = nil
    var timeRemaining = ""
    
    // Tracker's Data
    var dailyTracker: Tracker = Tracker(completed: 0, point: 0, streak: 0, date: Calendar.current.startOfDay(for: Date()))
                                            
    //MARK: - App's Logic
    
    // Home
    func greeting() -> String {
        let hour = Calendar.current.component(.hour, from: Date())
        switch hour {
        case 0..<6: return "Good Night,"
        case 6..<12: return "Good Morning,"
        case 12..<18: return "Good Afternoon,"
        case 18..<20: return "Good Evening,"
        case 20..<34: return "Good Night,"
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
        return DailyMood(mood: mood, date: Calendar.current.startOfDay(for: Date()))
    }
    
    func savedDailyMood(_ mood: Mood) {
        dailyMood = mood
        let dailyMood = createdDailyMood(mood)
        moodClient.saveMood(dailyMood)
    }
    
    func loadDailyMood() {
        let mood = moodClient.loadMood().mood
        dailyMood = mood
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
    
    func getMission()  {
        if let dailyMood  {
            let filtered = missionData.filter { $0.moodID == dailyMood.id }
            dailyMission = filtered.randomElement()
        }
    }
    
    func savedMission() {
        if let dailyMission  {
            missionClient.saveMission(dailyMission)
        }
    }
    
    func loadDailyMission() {
        let mission = missionClient.loadMission()
        dailyMission = mission
    }
    
    func handleDailyMission() -> Bool {
        guard let mission = dailyMission else {
            return false
        }
        return mission.completed
    }

    
    // Tracker
    func updatedTracker() {
        dailyTracker.completed += 1
        dailyTracker.point += dailyMission?.point ?? 0
        if trackerClient.checkForNewDay() {
            dailyTracker.streak += 1
            trackerClient.updateLastTrackDate(Calendar.current.startOfDay(for: Date()))
        }
    }
    
    
    func savedTracker(_ tracker: Tracker) {
        trackerClient.saveTracker(tracker)
    }
    
    func loadedTracker() {
        dailyTracker = trackerClient.loadTracker()
    }
    
    func resetAllData() {
        trackerClient.resetTracker()
        moodClient.resetMood()
        missionClient.resetMission()
    }
}
