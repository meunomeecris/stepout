import SwiftUI

struct MissionHome: View {
    @Environment(GetOuthereStore.self) var store
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationLink(destination: MissionView(store: _store)) {
            GeometryReader { geometry in
                    VStack(spacing: store.stopTimeRemaining ? 16 : 18) {
                        if store.dailyMission != nil {
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
                            .foregroundStyle(.white.opacity(0.6))
                            .textCase(.uppercase)
                            .font(.caption)
                            .kerning(2)
                    } else {
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
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.purple.opacity(0.1))
                    )
            }
        }
    }
}

#Preview {
    let store = GetOuthereStore()
    MissionHome()
        .environment(store)
}
