protocol AuthClient {
    func savedAppFlowState(_ state: Bool)
    func loadedAppFlowState() -> Bool
    func delteAppFlowState()
}
