import Foundation

struct MissionClientLive: MissionClient {
    private let userDefaultKey = "savedMission"
    
    func saveMission(_ mission: Mission) {
        if let data = try? JSONEncoder().encode(mission) {
            UserDefaults.standard.set(data, forKey: userDefaultKey)
        }
    }
    
    func loadMission() -> Mission? {
        let calendar = Calendar.current
        let now = Date()
        
        if let data = UserDefaults.standard.data(forKey: userDefaultKey),
           let savedMission = try? JSONDecoder().decode(Mission.self, from: data) {
            if calendar.isDate(savedMission.date, inSameDayAs: now) {
                return savedMission
            }
        }
        return  nil
    }
    
    func deleteMood() {
        UserDefaults.standard.removeObject(forKey: userDefaultKey)
    }
}
