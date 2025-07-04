import SwiftUI

struct Profile:View {
    @AppStorage("userIdentifier") var userIdentifier = ""
    @AppStorage("isSignedIn") var isSignedIn = false
    
    var body: some View {
        Button("Log Out") {
            logOut()
        }
        
    }
    
    private func logOut() {
        userIdentifier = ""
        isSignedIn = false
    }
}
