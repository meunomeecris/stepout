import SwiftUI

struct MoodPicker: View {
    @Environment(GetOuthereStore.self) var store
    
    var body: some View {
        @Bindable var bStore = store
        
        NavigationStack {
            VStack(spacing: 24) {
                TitleMood(store: _store)
                
                AllMoods(store: _store)
                
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
    let store = GetOuthereStore()
    MoodPicker()
        .environment(store)
}


struct TitleMood: View {
    @Environment(GetOuthereStore.self) var store
    
    var body: some View {
        VStack (spacing: 24) {
            Text("How are you\nfeeling today?")
                .multilineTextAlignment(.center)
                .font(.title)
                .bold()
                .padding(.top, 24)
            
            if let mood = store.dailyMood {
                Text(mood.id)
                    .font(.headline)
                    .bold()
                    .foregroundStyle(mood.color)
                    .kerning(3)
                    .textCase(.uppercase)
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(mood.color.opacity(0.2))
                    )
            } else {
                Text("MOOD")
                    .font(.headline)
                    .bold()
                    .kerning(3)
                    .foregroundStyle(.green)
                    .padding(20)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.green.opacity(0.2))
                    )
            }
        }
        .padding(.bottom, 24)
    }
}


struct AllMoods: View {
    @Environment(GetOuthereStore.self) var store
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 12) {
            ForEach(store.moodData) { mood in
                Button {
                    store.savedDailyMood(mood)
                    store.showGetMissionButton = true
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
    @Environment(GetOuthereStore.self) var store
    
    var body: some View {
        if store.dailyMood != nil && store.showGetMissionButton {
            Button("Get my mission") {
                store.getMission()
                store.navigateToMissions = true
                store.savedMission()
                store.showGetMissionButton = false
                store.stopTimeRemaining = false
            }
            .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
            .foregroundStyle(store.dailyMood?.color ?? .green)
            .bold()
            .textCase(.uppercase)
            .padding(24)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(store.dailyMood?.color ?? .green)
                    .opacity(0.1)
            )
        }
    }
}
