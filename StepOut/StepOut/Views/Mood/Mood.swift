import SwiftUI

struct MoodView: View {
    @Environment(SetpOutStore.self) var store
    
    var body: some View {
        @Bindable var bStore = store
        
        NavigationStack {
            VStack(spacing: 24) {
                TitleMood(isValid: store.hasMood, mood: store.handledMood())
                MoodPicker(store: _store)
                Spacer()
                ButtonNavToMission(store: _store)
            }
            .navigationDestination(isPresented: $bStore.navigateToMission) {
                MissionView(store: _store)
            }
        }
    }
}
    
#Preview {
    let store = SetpOutStore()
    MoodView()
        .environment(store)
}

private struct TitleMood: View {
    var isValid: Bool
    var mood: Mood
    
    var body: some View {
        VStack (spacing: 24) {
            TitleView(label: "How are you\nfeeling today?")
            
            if isValid {
                Text(mood.id)
                    .font(.headline)
                    .bold()
                    .foregroundStyle(mood.color)
                    .kerning(3)
                    .textCase(.uppercase)
                    .padding(20)
                    .roundedBackground(color: mood.color)
            } else {
                Text("MOOD")
                    .font(.headline)
                    .bold()
                    .kerning(3)
                    .foregroundStyle(.green)
                    .padding(20)
                    .roundedBackground(color: .green)

            }
        }
        .padding(.bottom, 24)
    }
}

private struct MoodPicker: View {
    @Environment(SetpOutStore.self) var store
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(store.moodData) { mood in
                Button {
                    store.savedDailyMood(mood)
                    store.getMissionButton = true
                } label: {
                    VStack(spacing: 0) {
                        Text(mood.emoji)
                            .font(.system(size: 40))
                            .padding()
                            .background(store.dailyMood == mood ? mood.color.opacity(0.3) : Color.clear)
                            .clipShape(Circle())
                        Text(mood.id)
                            .foregroundStyle(.white)
                            .textCase(.uppercase)
                            .font(.caption)
                            .kerning(2)
                    }
                }
            }
        }
    }
}

private struct ButtonNavToMission: View {
    @Environment(SetpOutStore.self) var store
    
    var body: some View {
        if store.hasMood && store.getMissionButton {
            Button("Get my mission") {
                store.getMission()
                store.navigateToMission = true
                store.savedMission()
                store.getMissionButton = false
            }
            .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
            .foregroundStyle(store.handledMood().color)
            .bold()
            .textCase(.uppercase)
            .padding(24)
            .roundedBackground(color: store.handledMood().color)
        }
    }
}
