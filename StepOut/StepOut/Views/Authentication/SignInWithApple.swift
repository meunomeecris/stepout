import SwiftUI
import AuthenticationServices

struct SignInWithApple: View {
    @Environment(SetpOutStore.self) var store
    @AppStorage("userIdentifier") var userIdentifier = ""
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                
                Text("Step Out")
                    .textCase(.uppercase)
                    .opacity(0.8)
                    .kerning(5)
                    .font(.title)
                    .bold()
                    .padding(.bottom,8)
                
                Text("You need an account to use this feature")
                    .multilineTextAlignment(.center)
                    .font(.callout)
                    .kerning(1)
                
                
                SignInWithAppleButton(.signIn) { request in
                    request.requestedScopes = [.email, .fullName]
                } onCompletion: { result in
                    switch result {
                    case .success(let auth):
                        handleAuthSuccess(auth)
                        store.completedLogin()
                    case . failure(let error):
                        print("Authorization failed: \(error.localizedDescription)")
                    }
                }
                .signInWithAppleButtonStyle(
                    colorScheme == .dark ? .white : .black
                )
                .frame(height: 50)
                .padding(.horizontal, 16
                )
                .padding(.top, 24)
                Spacer()
                
                Text("By signing up, you confirm that you are at least 13 years of age and agree to our terms and conditions.")
                    .font(.footnote)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 16)
            }
            .padding(16)
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
    let store = SetpOutStore()
    SignInWithApple()
        .environment(store)
}
