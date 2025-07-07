import Foundation

struct TrackerClientLive: TrackerClient {
    private let userDefaultKey = "savedTracker"
    private let lastTrackerUpdate = "lastTrackerUpdate"
    
    func saveTracker(_ tracker: Tracker) {
        if let data = try? JSONEncoder().encode(tracker) {
            UserDefaults.standard.set(data, forKey: userDefaultKey)
        }
    }
    
    func loadTracker() -> Tracker {
        if let data = UserDefaults.standard.data(forKey: userDefaultKey),
           let savedTracker = try? JSONDecoder().decode(Tracker.self, from: data) {
            return savedTracker
        }
        print("No saved mission found, resetting mood.")
        return Tracker(completed: 0, point: 0, streak: 0, date: Calendar.current.startOfDay(for: Date()))
    }
    
    func checkForNewDay() -> Bool {
        let today = Calendar.current.startOfDay(for: Date())
        let lastUpdate = UserDefaults.standard.object(forKey: lastTrackerUpdate) as? Date
        return lastUpdate == nil || !Calendar.current.isDate(today, inSameDayAs: lastUpdate!)
    }
    
    func updateLastTrackDate(_ date: Date) {
        UserDefaults.standard.set(Date(), forKey: lastTrackerUpdate)
    }
    
    func deleteTracker() {
        UserDefaults.standard.removeObject(forKey: userDefaultKey)
        UserDefaults.standard.removeObject(forKey: lastTrackerUpdate)
    }
}
