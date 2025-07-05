import SwiftUI

struct ProfileView: View {
    @Environment(GetOuthereStore.self) var store
    
    var body: some View {
        NavigationLink(destination: Profile()) {
            GeometryReader { geometry in
                VStack(spacing: 24) {
                    Image(systemName: "person")
                        .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
                        .foregroundStyle(.white)
                        .opacity(0.8)
                        .font(.title)
                    
                    Text("Profile")
                        .foregroundStyle(.red)
                        .bold()
                        .font(.title)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.red.opacity(0.1))
                )
            }
        }
    }
}

#Preview {
    ProfileView()
}
