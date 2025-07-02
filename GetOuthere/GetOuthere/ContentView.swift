import SwiftUI

struct ContentView: View {
    @Environment(GetOuthereStore.self) var store
    @AppStorage("isSignedIn") var isSignedIn: Bool = false
    
    var body: some View {
        Group {
            if isSignedIn {
                Home(store: _store)
            } else {
                SignInWithApple()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
