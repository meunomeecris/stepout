import SwiftUI

struct UniverseTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .foregroundStyle(.green)
            .bold()
            .focusable(true)
            .padding([.top, .bottom], 16)
            .padding(.horizontal)
            .background(.green.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .lineLimit(1)
    }
}

extension View {
    func universeTextFieldModifier() -> some View {
        self.modifier(UniverseTextFieldModifier())
    }
}
