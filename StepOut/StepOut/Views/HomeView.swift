import SwiftUI

struct HomeView: View {
    @Environment(SetpOutStore.self) var store
    @AppStorage("username") var usernameApple = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                GreetingView(
                    greeting: store.greeting(),
                    username: usernameApple,
                    date: store.currentDate()
                )
                TrackerDash(store: _store)
                HStack(spacing: 16) {
                    MoodHome(store: _store)
                    MissionHome(store: _store)
                }
                HStack(spacing: 16) {
                    MenuHome()
                    ChallengeHome()
                }
            }
            .padding(16)
            .onAppear {store.onAppearLoadUserData()}
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let store = SetpOutStore()
    HomeView()
        .environment(store)
}

private struct GreetingView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var greeting: String
    var username: String
    var date: String
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Step Out")
                    .textCase(.uppercase)
                    .opacity(0.8)
                    .kerning(5)
                    .font(.title3)
                    .bold()
                    .padding(.bottom,16)
                
                HStack {
                    Spacer()
                    Text(greeting)
                        .font(.title2)
                        .opacity(0.8)
                    
                    Text(username)
                        .font(.largeTitle)
                        .foregroundStyle(.green)
                        .bold()
                    Spacer()
                }
                
                Text(date)
                    .textCase(.uppercase)
                    .font(.caption)
                    .kerning(2)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .roundedBackground(color: .gray)
        }
    }
}









