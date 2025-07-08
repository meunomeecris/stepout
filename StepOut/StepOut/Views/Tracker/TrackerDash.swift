import SwiftUI

struct TrackerDash: View {
    @Environment(SetpOutStore.self) var store
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                TrackerItem(
                    icon: "flag.pattern.checkered",
                    value: store.dailyTracker.completed,
                    label: "Completed",
                    color: .green
                )
                
                Spacer()
                
                TrackerItem(
                    icon: "medal.star",
                    value: store.dailyTracker.point,
                    label: "Points",
                    color: .green
                )
                
                Spacer()
                
                TrackerItem(
                    icon: "flame",
                    value: store.dailyTracker.streak,
                    label: "Streak",
                    color: .green
                )
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

#Preview {
    TrackerDash()
}
