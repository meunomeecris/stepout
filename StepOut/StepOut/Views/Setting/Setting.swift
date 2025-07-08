import SwiftUI

struct Setting:View {
    @Environment(SetpOutStore.self) var store
    @AppStorage("userIdentifier") var userIdentifier = ""
    @AppStorage("isSignedIn") var isSignedIn = false
    
    var body: some View {
        Button("Log Out") {
            userIdentifier = ""
            store.logOut()
        }
        .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
        .foregroundStyle( .green)
        .bold()
        .textCase(.uppercase)
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.green)
                .opacity(0.1)
        )
        .padding(.bottom, 50)
        
        Button("Resete all Data") {
            store.deleteAccount()
        }
        .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
        .foregroundStyle(.green)
        .bold()
        .textCase(.uppercase)
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.green)
                .opacity(0.1)
        )
        
    }
}


#Preview {
    let store = SetpOutStore()
    Setting()
        .environment(store)
}
