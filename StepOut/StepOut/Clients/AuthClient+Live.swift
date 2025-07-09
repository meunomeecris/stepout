import Foundation

struct AuthClientLive: AuthClient {
    private let flowStateUerDefaultKey = "savedAppFlowState"
    
    func savedAppFlowState(_ state: Bool) {
        UserDefaults.standard.set(state, forKey: flowStateUerDefaultKey)
    }
    
    func loadedAppFlowState() -> Bool {
        return UserDefaults.standard.bool(forKey: flowStateUerDefaultKey)
    }
    
    func delteAppFlowState() {
        UserDefaults.standard.removeObject(forKey: flowStateUerDefaultKey)
    }
}
