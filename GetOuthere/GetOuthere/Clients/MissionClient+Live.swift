import Foundation

struct MissionClientLive: MissionClient {
    private let userDefaultKey = "savedMission"
    
    func saveMission(_ mission: Mission) {
        if let data = try? JSONEncoder().encode(mission) {
            UserDefaults.standard.set(data, forKey: userDefaultKey)
        }
    }
    
    func loadMission() -> Mission {
        if let data = UserDefaults.standard.data(forKey: userDefaultKey),
           let savedMission = try? JSONDecoder().decode(Mission.self, from: data) {
            return savedMission
        }
        
        return Mission(text: "Just Go Outhere and discovery the world!", points: 11, moodID: "okay")
    }
    
}
