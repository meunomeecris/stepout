import SwiftUI

struct MoodHome: View {
    @Environment(SetpOutStore.self) var store
    
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
                            .foregroundStyle(.white.opacity(0.6))
                            .textCase(.uppercase)
                            .font(.caption)
                            .kerning(2)
                    }
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(store.dailyMood?.color ?? .yellow)
                        .opacity(0.1)
                )
            }
        }
    }
}

#Preview {
    let store = SetpOutStore()
    MoodHome()
        .environment(store)
}
