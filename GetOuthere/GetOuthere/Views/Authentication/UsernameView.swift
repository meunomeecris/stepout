import SwiftUI

struct UsernameView: View {
    @Environment(GetOuthereStore.self) var store
    
    var body: some View {
        @Bindable var bStore = store
        VStack {
            VStack {
                Text(store.greeting())
                    .font(.title2)
                    .opacity(0.8)
                
                Text("Human.")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.green)
            }
            .padding(.bottom, 40)
            Text("What is you name?")
                .font(.title2)
                .opacity(0.8)
            
            GetOuthereTextFieldView()
                .padding(.bottom, 30)
            
            if !store.usernameInput.isEmpty {
                savedUsernameButton()
            }
        }
    }
}



#Preview {
    let store = GetOuthereStore()
    UsernameView()
        .environment(store)
}


struct GetOuthereTextFieldView: View {
    @Environment(GetOuthereStore.self) var store
    @FocusState private var focused: Bool
    
    var body: some View {
        @Bindable var bStore = store
        HStack {
            TextField(
                "",
                text: $bStore.usernameInput,
                prompt: Text("")
                    .foregroundStyle(.white.opacity(0.3))
            )
            .universeTextFieldModifier()
            .focused($focused)
            .submitLabel(.send)
            .onSubmit {
                store.completedUsername()
                store.savedUsername()
            }
        }
        .padding(.horizontal, 32)
        .animation(.easeInOut, value: 0.16)
    }
}


struct savedUsernameButton: View {
    @Environment(GetOuthereStore.self) var store
    
    var body: some View {
        Button("Let's start") {
            store.completedUsername()
            store.savedUsername()
        }
        .foregroundStyle(.green)
        .bold()
        .textCase(.uppercase)
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.green)
                .opacity(0.1)
        )
        .padding(.bottom, 16)
    }
}
