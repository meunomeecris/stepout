import SwiftUI

struct MissionHome: View {
    @Environment(SetpOutStore.self) var store
    
    var body: some View {
        NavigationLink(destination: MissionView(store: _store)) {
            if store.uncompletedMission {
                StartedDailyMission(store: _store)
            } else if store.isMissionCompleted {
                CompletedDailyMission()
            } else {
                EmptyDailyMission()
            }
        }
    }
}


#Preview {
    let store = SetpOutStore()
    MissionHome()
        .environment(store)
}


private struct StartedDailyMission: View {
    @Environment(SetpOutStore.self) var store
    @Environment(\.colorScheme) var colorScheme
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 12) {
                Image(systemName: "flag.pattern.checkered")
                    .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
                    .foregroundStyle(.purple)
                    .opacity(0.8)
                    .font(.title)
                
                Text("\(store.timeRemaining)")
                    .foregroundStyle(.purple)
                    .bold()
                    .opacity(0.8)
                    .font(.title)
                    .onAppear {
                        store.timeRemainingForMissionEnds()
                    }
                    .onReceive(timer) { _ in
                        store.timeRemainingForMissionEnds()
                    }
                
                Text("To finish\nthe mission")
                    .foregroundStyle(colorScheme == .dark ? .white.opacity(0.6) : .purple.opacity(0.8))
                    .textCase(.uppercase)
                    .font(.caption)
                    .kerning(2)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .roundedBackground(color: .purple)
        }
    }
}

private struct CompletedDailyMission: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 16) {
                Text("🎉")
                    .font(.system(size: 55))
                    .foregroundStyle(.purple)
                    .bold()
                    .opacity(0.8)
                
                Text("Accomplished Mission")
                    .foregroundStyle(colorScheme == .dark ? .white.opacity(0.6) : .purple.opacity(0.8))
                    .textCase(.uppercase)
                    .font(.caption)
                    .kerning(2)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .roundedBackground(color: .purple)
        }
    }
}

private struct EmptyDailyMission: View {
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 12) {
                Image(systemName: "flag.pattern.checkered")
                    .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
                    .foregroundStyle(.purple)
                    .opacity(0.8)
                    .font(.title)
                
                Text("Mission")
                    .foregroundStyle(.purple)
                    .bold()
                    .opacity(0.8)
                    .font(.title)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .roundedBackground(color: .purple)
        }
    }
}
