import SwiftUI

struct TrackerDash: View {
    @Environment(SetpOutStore.self) var store
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                TrackerItem(
                    icon: "flag.pattern.checkered",
                    value: store.dailyTracker.completed,
                    label: "Completed",
                )
                
                Spacer()
                
                TrackerItem(
                    icon: "medal.star",
                    value: store.dailyTracker.point,
                    label: "Points",
                )
                
                Spacer()
                
                TrackerItem(
                    icon: "flame",
                    value: store.dailyTracker.streak,
                    label: "Streak",
                )
            }
            .padding(.horizontal,16)
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(colorScheme == .dark ? .green.opacity(0.25) : .green.opacity(0.3))
            )
        }
    }
}

#Preview {
    TrackerDash()
}
