import SwiftUI

@main
struct SetpOutApp: App {
    private var store = SetpOutStore()
    
    var body: some Scene {
        WindowGroup {
            Root()
                .environment(store)
        }
    }
}
