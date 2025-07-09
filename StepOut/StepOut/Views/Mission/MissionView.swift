import SwiftUI
import Lottie

struct MissionView: View {
    @Environment(SetpOutStore.self) var store
    @Environment(\.colorScheme) var colorSchem
    
    var body: some View {
        VStack(spacing: 24) {
            if store.uncompletedMission {
                TitleView(label: "Today's mission")
                CardMission(
                    dailyMission: store.dailyMission ?? store.standartDailyMission,
                    dailyMood: store.dailyMood ?? store.standartDailyMood
                )
                Spacer()
                ButtonCompletedMission()
            } else if store.isMissionCompleted {
                PopUpView(store: _store)
            } else {
                MissionEmptyView()
            }
        }
        .padding(16)
    }
}

#Preview {
    let store = SetpOutStore()
    var newDaily: () = store.dailyMission = Mission(text: "Mission", point: 4, moodID: "happy", completed: false, date: Date())
    MissionView()
        .environment(store)
}

struct MissionEmptyView:View {
    var body: some View {
        LottieView(animation: .named("LookingAnimation"))
            .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
        Text("No missions yet!")
            .bold()
            .font(.title)
            .foregroundStyle(.green)
        Text("Start choosing your mood.")
            .foregroundStyle(.gray)
            .bold()
            .textCase(.uppercase)
            .font(.body)
            .kerning(2)
    }
}

struct ButtonCompletedMission: View {
    @Environment(SetpOutStore.self) var store
    
    var body: some View {
        Button("\(store.isMissionCompleted ? "Mission accomplished" : "Complete the mission")", systemImage: store.isMissionCompleted ? "flag.pattern.checkered" : "") {
            
            store.dailyMission?.completed = true
            store.savedMission()
            store.updatedTracker()
            store.savedTracker(store.dailyTracker)
            
        }
        .disabled(store.dailyMission!.completed)
        .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
        .foregroundStyle(store.isMissionCompleted ? .gray : store.dailyMood?.color ?? .green )
        .bold()
        .textCase(.uppercase)
        .padding(24)
        .roundedBackground(color: store.isMissionCompleted ? .gray : store.dailyMood?.color ?? .green )
    }
}


struct CardMission: View {
    var dailyMission: Mission
    var dailyMood: Mood
    
    var body: some View {
        VStack {
            Text(dailyMission.text)
                .foregroundStyle(dailyMission.completed ? .gray : dailyMood.color)
                .font(.title2)
                .multilineTextAlignment(.center)
                .padding(40)
                .bold()
            
            Divider()
                .foregroundStyle(dailyMission.completed ? .gray : dailyMood.color)
            
            HStack {
                Spacer()
                HStack {
                    Text(dailyMood.emoji)
                    Text(dailyMission.moodID.capitalized)
                        .font(.title3)
                        .foregroundStyle(dailyMission.completed ? .gray : dailyMood.color)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .roundedBackground(color: dailyMission.completed ? .gray : dailyMood.color)
                Spacer()
                HStack {
                    Text("\(dailyMission.point)")
                        .font(.title2)
                        .foregroundStyle(dailyMission.completed ? .gray : dailyMood.color)
                    Text("Points")
                        .font(.caption)
                        .textCase(.uppercase)
                        .kerning(2)
                        .foregroundStyle(dailyMission.completed ? .gray : dailyMood.color)
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 8)
                .roundedBackground(color: dailyMission.completed ? .gray : dailyMood.color)
                Spacer()
            }
            .padding()
        }
        .padding(16)
        .roundedBackground(color: dailyMission.completed ? .gray : dailyMood.color)
    }
}
