import SwiftUI

struct MissionView: View {
    @Environment(GetOuthereStore.self) var store
    
    var body: some View {
        VStack(spacing: 24) {
            if store.dailyMission !=  nil {
                TitleMission()
                CardMission(store: _store)
                Spacer()
                ButtonCompletedMission()
            } else {
                Text("No mission yet!\nStart choosing your mood.")
                    .font(.title)
                    .padding(16)
                    .multilineTextAlignment(.center)
            }
            
        }
        .padding(16)
    }
}

#Preview {
    let store = GetOuthereStore()
    MissionView()
        .environment(store)
}

struct TitleMission: View {
    var body: some View {
        Text("Today's mission")
            .multilineTextAlignment(.center)
            .font(.title)
            .bold()
            .padding(.top, 24)
    }
}

struct ButtonCompletedMission: View {
    @Environment(GetOuthereStore.self) var store

    var body: some View {
        Button("\(store.handleDailyMission() ? "Mission accomplished" : "Complete the mission")", systemImage: store.handleDailyMission() ? "flag.pattern.checkered" : "") {
            
            store.dailyMission?.completed = true
            store.savedMission()
            store.updatedTracker()
            store.savedTracker(store.dailyTracker)
            
        }
        .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
        .foregroundStyle(store.handleDailyMission() ? .gray : store.dailyMood?.color ?? .green )
        .bold()
        .textCase(.uppercase)
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(store.handleDailyMission() ? .gray : store.dailyMood?.color ?? .green )
                .opacity(0.1)
        )
        
    }
}



struct CardMission: View {
    @Environment(GetOuthereStore.self) var store
    
    var body: some View {
        VStack {
            Text(store.dailyMission?.text ?? "Just Get Outhere!")
                .foregroundStyle(store.handleDailyMission() ? .gray : store.dailyMood?.color ?? .green)
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding(40)
                .bold()
            
            Divider()
                .foregroundStyle(store.handleDailyMission() ? .gray : store.dailyMood?.color ?? .green)
            
            HStack {
                Spacer()
                HStack {
                    Text(store.dailyMood?.emoji ?? "🌻")
                    Text(store.dailyMission?.moodID.capitalized ?? "Mood")
                        .font(.title3)
                        .foregroundStyle(store.handleDailyMission() ? .gray : store.dailyMood?.color ?? .green)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(store.handleDailyMission() ? .gray : store.dailyMood?.color ?? .green)
                        .opacity(0.1)
                )
                Spacer()
                HStack {
                    Text("\(store.dailyMission?.point ?? 3)")
                        .font(.title2)
                        .foregroundStyle(store.handleDailyMission() ? .gray : store.dailyMood?.color ?? .green)
                    Text("Points")
                        .font(.caption)
                        .textCase(.uppercase)
                        .kerning(2)
                        .foregroundStyle(store.handleDailyMission() ? .gray : store.dailyMood?.color ?? .green)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(store.handleDailyMission() ? .gray : store.dailyMood?.color ?? .green)
                        .opacity(0.1)
                )
                Spacer()
            }
            .padding()
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(store.handleDailyMission() ?.gray : store.dailyMood?.color ?? .green)
                .opacity(0.1)
        )
    }
}

