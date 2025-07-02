import SwiftUI

struct Profile:View {
    @AppStorage("email") var email = ""
    @AppStorage("firstName") var firstName = ""
    @AppStorage("userIdentifier") var userIdentifier = ""
    @AppStorage("isSignedIn") var isSignedIn = false
    
    var body: some View {
        Button("Log Out") {
            logOut()
        }
        .foregroundColor(.red)
        .padding()
    }
    
    private func logOut() {
        userIdentifier = ""
        email = ""
        firstName = ""
        isSignedIn = false
    }
}
