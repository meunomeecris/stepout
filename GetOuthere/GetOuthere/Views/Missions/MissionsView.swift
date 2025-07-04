import SwiftUI

struct MissionsView: View {
    @Environment(GetOuthereStore.self) var store
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Today's mission")
                .multilineTextAlignment(.center)
                .font(.title)
                .bold()
                .padding(.top, 24)
            
            VStack {
                Text(store.dailyMission?.text ?? "Just Get Outhere!")
                    .foregroundStyle(store.dailyMood?.color ?? .yellow)
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
                            .foregroundStyle(store.dailyMood?.color ?? .yellow)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(store.dailyMood?.color ?? .yellow)
                            .opacity(0.1)
                    )
                    Spacer()
                    HStack {
                        Text("\(store.dailyMission?.points ?? 3)")
                            .font(.title3)
                            .foregroundStyle(store.dailyMood?.color ?? .yellow)
                        Text("Points")
                            .font(.caption)
                            .textCase(.uppercase)
                            .kerning(2)
                            .foregroundStyle(store.dailyMood?.color ?? .yellow)
                    }
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(store.dailyMood?.color ?? .yellow)
                            .opacity(0.1)
                    )
                    Spacer()
                }
                .padding()
            }
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(store.dailyMood?.color ?? .yellow)
                    .opacity(0.1)
            )
            
            Spacer()
        }
        .padding(16)
    }
}

#Preview {
    let store = GetOuthereStore()
    MissionsView()
        .environment(store)
}

//            Button("I did it!") {
//                //action
//            }
//            .foregroundStyle(.white)
//            .bold()
//            .padding()
//            .background(
//                RoundedRectangle(cornerRadius: 20)
//                    .fill(.green)
//            )
//            .opacity(0.8)


//                HStack(spacing: 32) {

