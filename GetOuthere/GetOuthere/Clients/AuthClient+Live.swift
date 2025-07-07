import Foundation

struct AuthClientLive: AuthClient {
    private let flowStateUerDefaultKey = "savedAppFlowState"
    private let UsernameUserDefaultKey = "savedUsername"

    func savedUsername(_ username: String) {
        UserDefaults.standard.set(username, forKey: UsernameUserDefaultKey)
    }
    
    func loadedUsername() -> String {
        return UserDefaults.standard.string(forKey: UsernameUserDefaultKey) ?? "Human"
    }
    
    func deleteUsername() {
        UserDefaults.standard.removeObject(forKey: UsernameUserDefaultKey)
    }
    
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
