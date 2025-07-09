import SwiftUI

struct MoodView: View {
    @Environment(SetpOutStore.self) var store
    
    var body: some View {
        @Bindable var bStore = store
        
        NavigationStack {
            VStack(spacing: 24) {
                TitleMood(store: _store)
                MoodPicker(store: _store)
                Spacer()
                ButtonNavToMission(store: _store)
            }
            .navigationDestination(isPresented: $bStore.navigateToMissions) {
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


struct TitleMood: View {
    @Environment(SetpOutStore.self) var store
    
    var body: some View {
        VStack (spacing: 24) {
            TitleView(label: "How are you\nfeeling today?")
            
            if let mood = store.dailyMood {
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


struct MoodPicker: View {
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


struct ButtonNavToMission: View {
    @Environment(SetpOutStore.self) var store
    
    var body: some View {
        if store.dailyMood != nil && store.getMissionButton {
            Button("Get my mission") {
                store.getMission()
                store.navigateToMissions = true
                store.savedMission()
                store.getMissionButton = false
                store.stopTimeRemaining = false
            }
            .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
            .foregroundStyle(store.dailyMood?.color ?? .green)
            .bold()
            .textCase(.uppercase)
            .padding(24)
            .roundedBackground(color: store.dailyMood?.color ?? .green)
        }
    }
}
