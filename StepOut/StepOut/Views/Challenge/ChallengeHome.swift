import SwiftUI

struct ChallengeHome: View {

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
                .roundedBackground(color: .indigo)
            }
        }
    }
}


#Preview {
    let store = SetpOutStore()
    ChallengeHome()
        .environment(store)
}
