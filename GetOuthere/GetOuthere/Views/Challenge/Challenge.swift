import SwiftUI

struct Challenge: View {
    @Environment(GetOuthereStore.self) var store

    var body: some View {
        NavigationLink(destination: ChallengeView()) {
            GeometryReader { geometry in
                VStack(spacing: 24) {
                    Image(systemName: "hands.and.sparkles")
                        .symbolEffect(.bounce.up.byLayer, options: .nonRepeating)
                        .foregroundStyle(.indigo)
                        .opacity(0.8)
                        .font(.title)

                    Text("Challenge")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.indigo)
                        .opacity(0.8)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.indigo.opacity(0.1))
                )
            }
        }
    }
}


#Preview {
    let store = GetOuthereStore()
    Challenge()
        .environment(store)
}
