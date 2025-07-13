import SwiftUI

struct Setting:View {
    @Environment(StepOutStore.self) var store
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
                store.deletedAccount()
            }
    }
}


#Preview {
    let store = StepOutStore()
    Setting()
        .environment(store)
}
