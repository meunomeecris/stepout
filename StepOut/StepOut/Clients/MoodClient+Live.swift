import Foundation

struct MoodClientLive: MoodClient {
    private let userDefaultKey = "savedUserMood"
    
    func saveMood(_ daily: DailyMood) {
        if let data = try? JSONEncoder().encode(daily) {
            UserDefaults.standard.set(data, forKey: userDefaultKey)
        }
    }
    
    func loadMood() -> DailyMood {
        let calendar = Calendar.current
        let now = Date()
        
        if let data = UserDefaults.standard.data(forKey: userDefaultKey),
           let savedMoods = try? JSONDecoder().decode(DailyMood.self, from: data) {
            if calendar.isDate(savedMoods.date, inSameDayAs: now) {
                return savedMoods
            }
        }
        return DailyMood(mood: Mood.init(id: "Mood", emoji: "🌻", colorName: "yellow"), date: Date())
    }
    
    func deleteMood() {
        UserDefaults.standard.removeObject(forKey: userDefaultKey)
    }
}

