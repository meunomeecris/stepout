import SwiftUI

struct MoodHome: View {
    @Environment(SetpOutStore.self) var store
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationLink(destination: MoodView(store: _store)) {
            GeometryReader { geometry in
                VStack(spacing: 12) {
                    if let mood = store.dailyMood {
                        Text(mood.emoji)
                            .font(.system(size: 42))
                        
                        Text(mood.id.capitalized)
                            .bold()
                            .foregroundStyle(mood.color)
                            .font(.title)
                        
                        Text("\(store.dailyMood == nil ? "" : "Mood")")
                            .foregroundStyle(colorScheme == .dark ? .white.opacity(0.6) : store.dailyMood?.color.opacity(0.7) ?? .yellow)
                            .textCase(.uppercase)
                            .font(.caption)
                            .kerning(2)
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .roundedBackground(color: store.dailyMood?.color ?? .yellow )
            }
        }
    }
}

#Preview {
    let store = SetpOutStore()
    MoodHome()
        .environment(store)
}
