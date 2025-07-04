import SwiftUI

struct CardsHome<Destination: View>: View {
    @Environment(GetOuthereStore.self) var store
    var image: String
    var title: String
    var color: Color
    let destination: () -> Destination

    var body: some View {
        NavigationLink(destination: destination) {
            GeometryReader { geometry in
                VStack(spacing: 24) {
                    Image(systemName: image)
                        .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
                        .foregroundStyle(.white)
                        .opacity(0.8)
                        .font(.title)

                    Text(title)
                        .foregroundStyle(color)
                        .bold()
                        .font(.title)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(color.opacity(0.1))
                )
            }
        }
    }
}
