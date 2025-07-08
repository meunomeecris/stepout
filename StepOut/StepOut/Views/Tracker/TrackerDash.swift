import SwiftUI

struct TrackerDash: View {
    @Environment(SetpOutStore.self) var store
    
    var body: some View {
//        NavigationLink(destination: TrackerDash(store: _store)) {
            GeometryReader { geometry in
                HStack {
                    item(icon: "flag.pattern.checkered", value: store.dailyTracker.completed, label: "Completed", color: .green)
                    
                    Spacer()
                    item(icon: "medal.star", value: store.dailyTracker.point, label: "Points", color: .green)
                    
                    Spacer()
                    
                    item(icon: "flame", value: store.dailyTracker.streak, label: "Streak", color: .green)
                }
                .padding(.horizontal,16)
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.green.opacity(0.1))
                )
            }
//        }
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

#Preview {
    TrackerDash()
}
