protocol AuthClient {
    func savedUsername(_ username: String)
    func loadedUsername() -> String
    func deleteUsername()
    
    func savedAppFlowState(_ state: Bool)
    func loadedAppFlowState() -> Bool
    func delteAppFlowState()
}
