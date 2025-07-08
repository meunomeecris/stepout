import SwiftUI

struct ButtonView: View {
    var label: String
    var color: Color
    var action: () -> Void
    
    var body: some View {
        Button(label) {
            action()
        }
        .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
        .foregroundStyle(color)
        .bold()
        .textCase(.uppercase)
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(color)
                .opacity(0.1)
        )
    }
}

//#Preview {
//    MoodKitButton()
//}
