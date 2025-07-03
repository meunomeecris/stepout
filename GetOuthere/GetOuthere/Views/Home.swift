import SwiftUI

struct Home: View {
    @Environment(GetOuthereStore.self) var store
    var moodColorBg = Color(.blue)
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Welcome(store: _store)
                
                MissionDashboard(store: _store)
                
                HStack {
                    MyMood(store: _store, color: store.moodColor)
                    MyMission(store: _store)
                }
                
                HStack {
                    CardsHome(store: _store, image: "person", title: "Profile", color: .red) {
                        Profile()
                    }
                    CardsHome(store: _store, image: "hands.and.sparkles", title: "Challenges", color: .teal) {
                        Challenges()
                    }
                }
            }
            .padding(16)
        }
    }
}

#Preview {
    let store = GetOuthereStore()
    Home()
        .environment(store)
}

struct Welcome: View {
    @Environment(GetOuthereStore.self) var store
    @AppStorage("firstName") var firstName = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Get Outhere")
                    .textCase(.uppercase)
                    .opacity(0.8)
                    .kerning(7)
                    .font(.title3)
                    .bold()
                    .padding(.bottom,16)
                
                HStack {
                    Spacer()
                    Text(store.greeting())
                        .font(.title2)
                        .opacity(0.8)
                    
                    Text("\(firstName.capitalized).")
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
                    .fill(Color.gray.opacity(0.08))
            )
        }
    }
}

struct MissionDashboard: View {
    @Environment(GetOuthereStore.self) var store
    
    var body: some View {
        NavigationLink(destination: MissionsControle(store: _store)) {
            GeometryReader { geometry in
                HStack {
                    item(icon: "flag.pattern.checkered", value: 0, label: "Missions\nCompleted", color: .green)
                    
                    Spacer()
                    item(icon: "star", value: 0, label: "Missions\nPoints", color: .green)
                    
                    Spacer()
                    
                    item(icon: "flame", value: 0, label: "Days\nStreak", color: .green)
                }
                .padding(.horizontal,16)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.green.opacity(0.1))
                )
            }
        }
    }
    @ViewBuilder
    private func item(icon: String, value: Int, label: String, color: Color) -> some View {
        VStack {
            Image(systemName: icon)
                .foregroundStyle(.white)
                .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
                .opacity(0.8)
                .font(.title)
            Text(String(value))
                .font(.system(size: 50))
                .foregroundStyle(color)
                .bold()
            Text(label)
                .foregroundStyle(.white.opacity(0.6))
                .textCase(.uppercase)
                .font(.caption)
                .kerning(2)
        }
    }
}

struct MyMood: View {
    @Environment(GetOuthereStore.self) var store
    @AppStorage("todaysMood") var todaysMood = "Mood"
    @AppStorage("emojiMood") var emojiMood = "🌻"
    var color: Color
    
    var body: some View {
        NavigationLink(destination: MoodPicker(store: _store)) {
            GeometryReader { geometry in
                VStack(spacing: 24) {
                    Text(emojiMood)
                        .font(.largeTitle)
                    
                    Text(todaysMood.capitalized)
                        .bold()
                        .foregroundStyle(color)
                        .font(.title)
                    
                    Text("Mood")
                        .foregroundStyle(.white.opacity(0.6))
                        .textCase(.uppercase)
                        .font(.caption)
                        .kerning(2)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(color.opacity(0.1))
                    
                )
            }
        }
    }
}

struct MyMission: View {
    @Environment(GetOuthereStore.self) var store
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationLink(destination: Missions(store: _store)) {
            GeometryReader { geometry in
                VStack(spacing: 24) {
                    Image(systemName: "medal.star")
                        .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
                        .foregroundStyle(.white)
                        .opacity(0.8)
                        .font(.title)
                    
                    Text(store.timeRemaining)
                        .foregroundStyle(.purple)
                        .bold()
                        .font(.title)
                        .onAppear {
                            store.timeRemainingForMissionEnds()
                        }
                        .onReceive(timer) { _ in
                            store.timeRemainingForMissionEnds()
                        }
                    
                    Text("Mission")
                        .foregroundStyle(.white.opacity(0.6))
                        .textCase(.uppercase)
                        .font(.caption)
                        .kerning(2)
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.purple.opacity(0.1))
                )
            }
        }
    }
}


struct CardsHome<Destination: View>: View {
    @Environment(GetOuthereStore.self) var store
    var image: String
    var title: String
    var color: Color
    let destination: () -> Destination
    
    var body: some View {
        NavigationLink(destination: destination) {
            GeometryReader { geometry in
                VStack(spacing: 24) {
                    Image(systemName: image)
                        .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
                        .foregroundStyle(.white)
                        .opacity(0.8)
                        .font(.title)
                    
                    Text(title)
                        .foregroundStyle(color)
                        .bold()
                        .font(.title)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(color.opacity(0.1))
                )
            }
        }
    }
}
