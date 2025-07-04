import SwiftUI

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

#Preview {
    MissionsHome()
}
