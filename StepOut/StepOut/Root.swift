import SwiftUI

struct Root: View {
    @Environment(StepOutStore.self) var store
    
    var body: some View {
        Group {
            switch store.flowState {
            case .login:
                SignInWithApple()
            case .home:
                HomeView()
            }
        }
        .animation(.easeOut, value: store.flowState)
        .transition(.slide)
    }
}

#Preview {
    let store = StepOutStore()
    Root()
        .environment(store)
}
