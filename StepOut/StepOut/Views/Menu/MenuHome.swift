import SwiftUI

struct MenuHome: View {
    var body: some View {
        NavigationLink(destination: Setting()) {
            GeometryReader { geometry in
                VStack(spacing: 24) {
                    Image(systemName: "gearshape")
                        .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
                        .font(.title)
                        .foregroundStyle(.cyan)
                        .opacity(0.8)
                    
                    Text("Menu")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.cyan)
                        .opacity(0.8)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .roundedBackground(color: .cyan)
            }
        }
    }
}


#Preview {
    let store = SetpOutStore()
    MenuHome()
        .environment(store)
}
