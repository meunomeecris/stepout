import SwiftUI

struct Home: View {
    @Environment(GetOuthereStore.self) var store
    
    var body: some View {
        NavigationStack {
                VStack(spacing: 16) {
                    Welcome(store: _store)
                    
                    MissionDashboard(store: _store)
                    
                    HStack {
                        MyMood(store: _store)
                        MyMission(store: _store)
                    }
                    
                    HStack {
                        ProfileView(store: _store)
                        CreateMission(store: _store)
                    }
                }
        }
        .padding(16)
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
                
                Text("\(firstName).")
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
        NavigationLink(destination: MissionsControlle(store: _store)) {
            GeometryReader { geometry in
                HStack {
                    VStack {
                        Image(systemName: "flag.pattern.checkered")
                            .foregroundStyle(.white)
                            .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
                            .opacity(0.8)
                            .font(.title)
                        Text("03")
                            .font(.system(size: 50))
                            .foregroundStyle(.green)
                            .bold()
                        Text("Completed")
                            .foregroundStyle(.white)
                            .textCase(.uppercase)
                            .font(.caption)
                            .kerning(2)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Image(systemName: "star")
                            .foregroundStyle(.white)
                            .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
                            .opacity(0.8)
                            .font(.title)
                        Text("113")
                            .font(.system(size: 50))
                            .foregroundStyle(.green)
                            .bold()
                        Text("Points")
                            .foregroundStyle(.white)
                            .textCase(.uppercase)
                            .font(.caption)
                            .kerning(2)
                    }
                    Spacer()
                    VStack {
                        Image(systemName: "flame")
                            .foregroundStyle(.white)
                            .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
                            .opacity(0.8)
                            .font(.title)
                        Text("7")
                            .font(.system(size: 50))
                            .foregroundStyle(.green)
                            .bold()
                        Text("Streak")
                            .foregroundStyle(.white)
                            .textCase(.uppercase)
                            .font(.caption)
                            .kerning(2)
                    }
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
}

struct MyMood: View {
    @Environment(GetOuthereStore.self) var store
    
    var body: some View {
        NavigationLink(destination: MoodPicker(store: _store)) {
            GeometryReader { geometry in
                VStack(spacing: 24) {
                    Text(store.selectedMood?.emoji ?? "👀")
                        .font(.largeTitle)
                    
                    Text(store.selectedMood?.rawValue ?? "Waiting")
                        .bold()
                        .foregroundStyle(.yellow)
                        .textCase(.uppercase)
                        .font(.title)
                    
                    Text("Mood")
                        .foregroundStyle(.white)
                        .foregroundStyle(.white)
                        .textCase(.uppercase)
                        .font(.caption)
                        .kerning(2)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.yellow.opacity(0.1))
                    
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
                        .foregroundStyle(.white)
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

struct ProfileView: View {
    @Environment(GetOuthereStore.self) var store
    var body: some View {
        NavigationLink(destination: Profile()) {
            GeometryReader { geometry in
                VStack(spacing: 24) {
                    Image(systemName: "person")
                        .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
                        .foregroundStyle(.white)
                        .opacity(0.8)
                        .font(.title)
                    
                    Text("Profile")
                        .foregroundStyle(.red)
                        .bold()
                        .font(.title)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.red.opacity(0.1))
                )
            }
        }
    }
}

struct CreateMission: View {
    @Environment(GetOuthereStore.self) var store
    var body: some View {
        NavigationLink(destination: Challenges()) {
            GeometryReader { geometry in
                VStack(spacing: 24) {
                    Image(systemName: "hands.and.sparkles")
                        .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
                        .foregroundStyle(.white)
                        .opacity(0.8)
                        .font(.title)
                    
                    Text("Challenges")
                        .foregroundStyle(.teal)
                        .bold()
                        .font(.title)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.teal.opacity(0.1))
                )
            }
        }
    }
}




