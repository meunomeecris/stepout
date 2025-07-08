import SwiftUI

struct TrackerItem: View {
    var icon: String
    var value: Int
    var label: String
    var color: Color
    var body: some View {
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


//#Preview {
//    TrackerItem()
//}
