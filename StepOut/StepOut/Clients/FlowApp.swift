protocol FlowApp {
    func savedAppFlowState(_ state: Bool)
    func loadedAppFlowState() -> Bool
    func delteAppFlowState()
}
