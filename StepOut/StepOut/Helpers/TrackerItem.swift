import SwiftUI

struct TrackerItem: View {
    @Environment(\.colorScheme) var colorScheme
    var icon: String
    var value: Int
    var label: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .foregroundStyle(colorScheme == .dark ? .white : .green.opacity(0.7))
                .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
                .opacity(0.8)
                .font(.title)
            Text(String(value))
                .font(.system(size: 50))
                .foregroundStyle(.green)
                .bold()
            Text(label)
                .foregroundStyle(colorScheme == .dark ? .white : .green.opacity(0.9))
                .textCase(.uppercase)
                .font(.caption)
                .kerning(2)
        }
    }
}


//#Preview {
//    TrackerItem()
//}
