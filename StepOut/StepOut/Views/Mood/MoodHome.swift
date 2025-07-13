import SwiftUI

struct MoodHome: View {
    @Environment(StepOutStore.self) var store
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationLink(destination: MoodView(store: _store)) {
            if store.hasMood {
                UserMoodView(mood: store.handledMood())
            } else {
                EmptyMoodView()
            }
        }
    }
}

#Preview {
    let store = StepOutStore()
    MoodHome()
        .environment(store)
}

private struct UserMoodView: View {
    @Environment(\.colorScheme) var colorScheme
    var mood: Mood
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 12) {
                Text(mood.emoji)
                    .font(.system(size: 42))
                
                Text(mood.id.capitalized)
                    .bold()
                    .foregroundStyle(mood.color)
                    .font(.title)
                
                Text("Mood")
                    .foregroundStyle(colorScheme == .dark ? .white.opacity(0.6) : mood.color.opacity(0.7))
                    .textCase(.uppercase)
                    .font(.caption)
                    .kerning(2)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .roundedBackground(color: mood.color)
        }
    }
}


private struct EmptyMoodView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 12) {
                Text("🌻")
                    .font(.system(size: 42))
                
                Text("Mood")
                    .bold()
                    .foregroundStyle(.yellow)
                    .font(.title)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .roundedBackground(color: .yellow)
        }
    }
}
