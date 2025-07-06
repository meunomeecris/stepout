import SwiftUI

struct Setting:View {
    @Environment(GetOuthereStore.self) var store
    @AppStorage("userIdentifier") var userIdentifier = ""
    @AppStorage("isSignedIn") var isSignedIn = false
    
    var body: some View {
        Button("Log Out") {
            logOut()
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
            store.resetAllData()
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
    
    private func logOut() {
        userIdentifier = ""
        isSignedIn = false
    }
}


#Preview {
    let store = GetOuthereStore()
    Setting()
        .environment(store)
}
