import Foundation

protocol TrackerClient {
    func saveTracker(_ tracker: Tracker)
    func loadTracker() -> Tracker
    func checkForNewDay() -> Bool
    func updateLastTrackDate(_ date: Date)
    func resetTracker()
}
