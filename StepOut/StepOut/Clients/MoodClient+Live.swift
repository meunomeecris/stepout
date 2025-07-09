import Foundation

struct MoodClientLive: MoodClient {
    private let userDefaultKey = "savedUserMood"
    
    func createMood(_ mood: Mood) -> DailyMood {
        return DailyMood(mood: mood, date: Calendar.current.startOfDay(for: Date()))
    }
    
    func saveMood(_ daily: DailyMood) {
        if let data = try? JSONEncoder().encode(daily) {
            UserDefaults.standard.set(data, forKey: userDefaultKey)
        }
    }
    
    func loadMood() -> DailyMood? {
        let calendar = Calendar.current
        let now = Date()
        
        if let data = UserDefaults.standard.data(forKey: userDefaultKey),
           let savedMoods = try? JSONDecoder().decode(DailyMood.self, from: data) {
            if calendar.isDate(savedMoods.date, inSameDayAs: now) {
                return savedMoods
            }
        }
        return nil
    }
    
    func deleteMood() {
        UserDefaults.standard.removeObject(forKey: userDefaultKey)
    }
}

