import SwiftUI

struct ContentView: View {
    @Environment(GetOuthereStore.self) var store
    
    var body: some View {
        Home(store: _store)
    }
}

#Preview {
    ContentView()
}
