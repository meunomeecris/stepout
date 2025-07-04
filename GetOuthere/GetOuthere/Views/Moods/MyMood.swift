import SwiftUI

struct MyMood: View {
    @Environment(GetOuthereStore.self) var store
    @AppStorage("todaysMood") var todaysMood = "Mood"
    
    var body: some View {
        NavigationLink(destination: MoodPicker(store: _store)) {
                GeometryReader { geometry in
                    VStack(spacing: 16) {
                            Text(Mood(rawValue: todaysMood)?.emoji ?? "🌻")
                            .font(.system(size: 48))
                            
                        Text(Mood(rawValue: todaysMood)?.rawValue.capitalized ?? "Mood")
                                .bold()
                                .foregroundStyle(Mood(rawValue: todaysMood)?.color ?? .yellow)
                                .font(.title)
                            
                            Text("Mood")
                                .foregroundStyle(.white.opacity(0.6))
                                .textCase(.uppercase)
                                .font(.caption)
                                .kerning(2)
                    }
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Mood(rawValue: todaysMood)?.color ?? .yellow)
                            .opacity(0.1)
                    )
                
            }
        }
    }
}
