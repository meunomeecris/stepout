import SwiftUI

struct MissionHome: View {
    @Environment(SetpOutStore.self) var store
    
    var body: some View {
        NavigationLink(destination: MissionView(store: _store)) {
            GeometryReader { geometry in
                VStack(spacing: store.stopTimeRemaining ? 16 : 18) {
                    if store.hasMission {
                        StartedDailyMission(store: _store)
                    } else {
                        EmptyDailyMission(store: _store)
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .roundedBackground(color: .purple)
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
        Image(systemName: "\(store.stopTimeRemaining ? "": "flag.pattern.checkered")")
            .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
            .foregroundStyle(.purple)
            .opacity(0.8)
            .font(.title)
        
        Text("\(store.stopTimeRemaining ? "🎉" : store.timeRemaining )")
            .foregroundStyle(.purple)
            .bold()
            .opacity(0.8)
            .font(store.stopTimeRemaining ? .system(size: 55) : .title)
            .onAppear {
                store.isNewTimeRemainingStarted()
            }
            .onReceive(timer) { _ in
                store.isNewTimeRemainingStarted()
            }
        
        Text("\(store.stopTimeRemaining ? "Accomplished Mission" : "To finish\nthe mission")")
            .foregroundStyle(colorScheme == .dark ? .white.opacity(0.6) : .purple.opacity(0.8))
            .textCase(.uppercase)
            .font(.caption)
            .kerning(2)
    }
}


private struct EmptyDailyMission: View {
    @Environment(SetpOutStore.self) var store
    @Environment(\.colorScheme) var colorScheme
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
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
            .onAppear {
                store.isNewTimeRemainingStarted()
            }
            .onReceive(timer) { _ in
                store.isNewTimeRemainingStarted()
            }
    }
}
