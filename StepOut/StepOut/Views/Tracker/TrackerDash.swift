import SwiftUI

struct TrackerDash: View {
    @Environment(StepOutStore.self) var store
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
            .roundedBackground(color: colorScheme == .dark ? .green.opacity(1.2) : .green.opacity(0.9))
        }
    }
}

#Preview {
    TrackerDash()
}
