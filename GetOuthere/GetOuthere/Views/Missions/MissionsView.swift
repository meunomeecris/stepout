import SwiftUI

struct MissionsView: View {
    @Environment(GetOuthereStore.self) var store
    
    var body: some View {
        VStack(spacing: 24) {
            TitleMission()
            CardMission(store: _store)
            Spacer()
            ButtonCompletedMission()
        }
        .padding(16)
    }
}

#Preview {
    let store = GetOuthereStore()
    MissionsView()
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
        Button("\(store.missionCompleted ? "Mission accomplished" : "Complet Mission")", systemImage: "flag.pattern.checkered") {
            store.dailyMission?.completed = true
            store.missionCompleted = ((store.dailyMission?.completed) != nil)
        }
        .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
        .foregroundStyle(store.missionCompleted  ?.gray : .green)
        .bold()
        .textCase(.uppercase)
        .padding(24)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(store.missionCompleted ? .gray : .green)
                .opacity(0.1)
        )
        
    }
}

struct CardMission: View {
    @Environment(GetOuthereStore.self) var store
    
    var body: some View {
        VStack {
            Text(store.dailyMission?.text ?? "Just Get Outhere!")
                .foregroundStyle(store.missionCompleted ? .gray : store.dailyMood?.color ?? .yellow)
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding(40)
                .bold()
            
            Divider()
                .foregroundStyle(.green)
            
            HStack {
                Spacer()
                HStack {
                    Text(store.dailyMood?.emoji ?? "🌻")
                    Text(store.dailyMission?.moodID.capitalized ?? "Mood")
                        .font(.title3)
                        .foregroundStyle(store.missionCompleted ? .gray : store.dailyMood?.color ?? .yellow)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(store.missionCompleted ? .gray : store.dailyMood?.color ?? .yellow)
                        .opacity(0.1)
                )
                Spacer()
                HStack {
                    Text("\(store.dailyMission?.points ?? 3)")
                        .font(.title2)
                        .foregroundStyle(store.missionCompleted ? .gray : store.dailyMood?.color ?? .yellow)
                    Text("Points")
                        .font(.caption)
                        .textCase(.uppercase)
                        .kerning(2)
                        .foregroundStyle(store.missionCompleted ? .gray : store.dailyMood?.color ?? .yellow)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(store.missionCompleted ? .gray : store.dailyMood?.color ?? .yellow)
                        .opacity(0.1)
                )
                Spacer()
            }
            .padding()
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(store.missionCompleted ? .gray : store.dailyMood?.color ?? .yellow)
                .opacity(0.1)
        )
    }
}

