import SwiftUI

struct MoodPicker: View {
    @Environment(GetOuthereStore.self) var store
    @Environment(\.modelContext) var context
    @AppStorage("todaysMood") var todaysMood = "Mood"

    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        @Bindable var store = store
        
        NavigationStack {
            VStack(spacing: 24) {
                VStack (spacing: 24) {
                    Text("How are you\nfeeling today?")
                        .multilineTextAlignment(.center)
                        .font(.title)
                        .bold()
                        .padding(.top, 24)
                    
                    if let mood = store.selectedMood {
                            Text(mood.rawValue)
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
                            .foregroundStyle(.green)
                            .padding(20)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.green.opacity(0.2))
                            )
                    }
                }
                .padding(.bottom, 24)
                
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(Mood.allCases) { mood in
                        Button {
                            store.selectedMood = mood
                            todaysMood = mood.rawValue
                            
                        } label: {
                            VStack(spacing: 0) {
                                Text(mood.emoji)
                                    .font(.system(size: 40))
                                    .padding()
                                    .background(store.selectedMood == mood ? mood.color.opacity(0.3) : Color.clear)
                                    .clipShape(Circle())
                                Text(mood.rawValue)
                                    .foregroundStyle(.white)
                                    .textCase(.uppercase)
                                    .font(.caption)
                                    .kerning(2)
                            }
                        }
                        
                    }
                }
                
                Spacer()
                
                if store.selectedMood != nil {
                    Button("Get my mission") {
                        store.navigateToMissions = true
                        store.showMission()
                        
                    }
                    .foregroundStyle(.white)
                    .bold()
                    .textCase(.uppercase)
                    .padding(24)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.green.opacity(0.8))
                    )
                }
                
                Spacer()
            }
            .navigationDestination(isPresented: $store.navigateToMissions) {
                Missions()
            }
        }
    }
}

#Preview {
    let store = GetOuthereStore()

    MoodPicker()
        .environment(store)
}
