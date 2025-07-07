import SwiftUI

struct SettingHome: View {
    @Environment(GetOuthereStore.self) var store
    
    var body: some View {
        NavigationLink(destination: Setting()) {
            GeometryReader { geometry in
                VStack(spacing: 24) {
                    Image(systemName: "gearshape")
                        .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
                        .font(.title)
                        .foregroundStyle(.brown)
                        .opacity(0.8)
                    
                    Text("Menu")
                        .font(.title)
                        .bold()
                        .foregroundStyle(.brown)
                        .opacity(0.8)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.brown.opacity(0.08))
                )
            }
        }
    }
}


#Preview {
    let store = GetOuthereStore()
    SettingHome()
        .environment(store)
}
