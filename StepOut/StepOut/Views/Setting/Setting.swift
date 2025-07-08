import SwiftUI

struct Setting:View {
    @Environment(SetpOutStore.self) var store
    @AppStorage("userIdentifier") var userIdentifier = ""
    @AppStorage("isSignedIn") var isSignedIn = false
    
    var body: some View {
        ButtonView(
            label: "Log Out",
            color: .green) {
                userIdentifier = ""
                store.logOut()
            }

        .padding(.bottom, 50)
        
        ButtonView(
            label: "Delet my account",
            color: .green) {
                store.deleteAccount()
            }
    }
}


#Preview {
    let store = SetpOutStore()
    Setting()
        .environment(store)
}
