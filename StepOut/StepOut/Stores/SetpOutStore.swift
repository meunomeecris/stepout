import Foundation
import SwiftUI

@Observable final class SetpOutStore {
    private let moodClient = MoodClientLive()
    private let missionClient = MissionClientLive()
    private let trackerClient = TrackerClientLive()
    private let authClient = AuthClientLive()
    
    //Authentication
    var flowState: AppFlowState = .login
    var isUserLogged: Bool {
        get { authClient.loadedAppFlowState() }
        set {
            authClient.savedAppFlowState(newValue)
            flowState = newValue ? .home : .login
        }
    }
    
    init() {
        flowState = isUserLogged ? .home : .login
    }
    
    // Home's Data {
    func onAppearLoadUserData() {
        loadedDailyMood()
        loadedDailyMission()
        loadedTracker()
    }
    
    // Mood's Data
    let moodData: [Mood] = Mood.allMoods
    var dailyMood: Mood? = nil
    var navigateToMission: Bool = false
    var getMissionButton: Bool = false
    
    let standartDailyMood: Mood = Mood(id: "Motivated",emoji: "😏",colorName: "yellow")
    
    // Mission's Data
    let missionData: [Mission] = Mission.allMissions
    var dailyMission: Mission? = nil
    var timeRemaining = ""
    
    let standartDailyMission: Mission = Mission(text: "Just Go out!",point: 6,moodID: "happy",completed: false,date: Date())
    
    // Tracker's Data
    var dailyTracker: Tracker = Tracker(completed: 0, point: 0, streak: 0, date: Calendar.current.startOfDay(for: Date()))
    
                                            
    //MARK: - App's Logic
    
    //Authentication
    func completedLogin() { isUserLogged = true }
    
    func logOut() { isUserLogged = false }
    
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
    var hasMood: Bool { dailyMood != nil }
    
    func handledMood() -> Mood {
        return dailyMood ?? standartDailyMood
    }
    
    func savedDailyMood(_ mood: Mood) {
        dailyMood = mood
        let dailyMood = moodClient.createMood(mood)
        moodClient.saveMood(dailyMood)
    }
    
    func loadedDailyMood() {
        let mood = moodClient.loadMood()?.mood
        dailyMood = mood
    }
    
    // Mission
    var hasMission: Bool { dailyMission != nil }
    
    var isMissionCompleted: Bool { dailyMission?.completed == true }
    
    var uncompletedMission: Bool {
        if let mission = dailyMission {
            return !mission.completed
        }
        return false
    }
    
    func handledMission() -> Mission {
        return dailyMission ?? standartDailyMission
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
    
    func loadedDailyMission() {
        let mission = missionClient.loadMission()
        dailyMission = mission
    }
    
    func timeRemainingForMissionEnds() {
        guard let midnight = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date().addingTimeInterval(86400)) else {
            timeRemaining = "Mission's"
            return
        }
        
        let remainingSeconds = Int(midnight.timeIntervalSince(Date()))
        let hours = remainingSeconds / 3600
        let minutes = (remainingSeconds % 3600) / 60
        let seconds = remainingSeconds % 60
        
        timeRemaining = String(format: "%02d:%02d:%02d", hours, minutes, seconds)
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
    
     //Menu
    func deletedAccount() {
        trackerClient.deleteTracker()
        moodClient.deleteMood()
        missionClient.deleteMood()
        authClient.delteAppFlowState()
        logOut()
    }
}
