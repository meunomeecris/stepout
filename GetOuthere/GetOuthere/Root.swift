import SwiftUI

struct Root: View {
    @Environment(GetOuthereStore.self) var store
    
    var body: some View {
        Group {
            switch store.flowState {
            case .login:
                SignInWithApple()
            case .username:
                UsernameView()
            case .home:
                HomeView()
            }
        }
        .animation(.easeOut, value: store.flowState)
        .transition(.slide)
    }
}

#Preview {
    let store = GetOuthereStore()
    Root()
        .environment(store)
}
