import SwiftUI

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

#Preview {
    MissionDashboard()
}
