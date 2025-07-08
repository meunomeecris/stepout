import SwiftUI

struct HomeView: View {
    @Environment(SetpOutStore.self) var store
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Welcome(store: _store)
                TrackerDash(store: _store)
                HStack {
                    MoodHome(store: _store)
                    MissionHome(store: _store)
                }
                HStack {
                    MenuHome()
                    ChallengeHome()
                }
            }
            .padding(16)
            .onAppear {
                store.loadDailyMood()
                store.loadDailyMission()
                store.loadedTracker()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let store = SetpOutStore()
    HomeView()
        .environment(store)
}

struct Welcome: View {
    @Environment(SetpOutStore.self) var store
    @AppStorage("username") var usernameApple = ""
    @Environment(\.colorScheme) var colorScheme
    
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
                    Text(store.greeting())
                        .font(.title2)
                        .opacity(0.8)
                    
                    Text("\(usernameApple.capitalized).")
                        .font(.largeTitle)
                        .foregroundStyle(.green)
                        .bold()
                    Spacer()
                }
                
                Text(store.currentDate())
                    .textCase(.uppercase)
                    .font(.caption)
                    .kerning(2)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(.gray.opacity(0.1))
            )
        }
    }
}









