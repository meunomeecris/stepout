import SwiftUI
import AuthenticationServices

struct SignInWithApple: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("userIdentifier") var userIdentifier = ""
    @AppStorage("isSignedIn") var isSignedIn = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                Text("Get Outhere")
                    .textCase(.uppercase)
                    .opacity(0.8)
                    .kerning(7)
                    .font(.title3)
                    .bold()
                    .padding(.bottom,16)
                
                
                SignInWithAppleButton(.signIn) { request in
                    request.requestedScopes = [.email, .fullName]
                } onCompletion: { result in
                    switch result {
                    case .success(let auth):
                        handleAuthSuccess(auth)
                        isSignedIn = true
                    case . failure(let error):
                        print("Authorization failed: \(error.localizedDescription)")
                    }
                }
                .signInWithAppleButtonStyle(
                    colorScheme == .dark ? .white : .black
                )
                .frame(height: 50)
                .padding()
                Spacer()
            }
        }
    }
    
    private func handleAuthSuccess(_ result: ASAuthorization) {
        guard let credential = result.credential as? ASAuthorizationAppleIDCredential else { return }
        
        let userIdentifier = credential.user
        print("User Identifier: \(userIdentifier)")
        self.userIdentifier = userIdentifier
    }

}


#Preview {
    let store = GetOuthereStore()
    SignInWithApple()
        .environment(store)
}
