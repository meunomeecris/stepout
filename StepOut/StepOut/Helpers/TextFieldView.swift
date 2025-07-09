import SwiftUI

struct TextFieldView: ViewModifier {
    func body(content: Content) -> some View {
        content
            .focusable(true)
            .font(.title2)
            .foregroundStyle(.green)
            .bold()
            .padding([.top, .bottom], 16)
            .padding(.horizontal)
            .background(.green.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .lineLimit(1)
    }
}

extension View {
    func textFieldStyle() -> some View {
        self.modifier(TextFieldView())
    }
}

#Preview {
    TextField("Test", text: .constant(""))
        .textFieldStyle()
}
