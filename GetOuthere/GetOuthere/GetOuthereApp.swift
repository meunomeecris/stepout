import SwiftUI

@main
struct GetOuthereApp: App {
    private var store = GetOuthereStore()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(store)
        }
    }
}
