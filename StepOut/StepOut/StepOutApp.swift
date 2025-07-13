import SwiftUI

@main
struct StepOutApp: App {
    private var store = StepOutStore()
    
    var body: some Scene {
        WindowGroup {
            Root()
                .environment(store)
        }
    }
}
