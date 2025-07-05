import Foundation

struct MissionClientLive: MissionClient {
    private let userDefaultKey = "savedMission"
    
    func saveMission(_ mission: Mission) {
        if let data = try? JSONEncoder().encode(mission) {
            UserDefaults.standard.set(data, forKey: userDefaultKey)
        }
    }
    
    func loadMission() -> Mission {
        let calendar = Calendar.current
        let now = Date()
        
        if let data = UserDefaults.standard.data(forKey: userDefaultKey),
           let savedMission = try? JSONDecoder().decode(Mission.self, from: data) {
            if calendar.isDate(savedMission.date, inSameDayAs: now) {
                return savedMission
            }
        }
        print("No saved mission found, resetting mood.")
        return Mission(text: "Just Go Outhere and discovery the world!", point: 10, moodID: "okay", completed: false, date: Calendar.current.startOfDay(for: Date()))
    }
    
    func resetMission() {
        UserDefaults.standard.removeObject(forKey: userDefaultKey)
    }
}
