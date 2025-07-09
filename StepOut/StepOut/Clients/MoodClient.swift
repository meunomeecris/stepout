protocol MoodClient {
    func createMood(_ mood: Mood) -> DailyMood
    func saveMood(_ daily: DailyMood)
    func loadMood() -> DailyMood?
    func deleteMood()
}
