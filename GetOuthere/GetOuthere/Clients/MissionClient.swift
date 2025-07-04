protocol MissionClient {
    func saveMission(_ mission: Mission)
    func loadMission() -> Mission
}
