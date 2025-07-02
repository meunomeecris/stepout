import SwiftUI

struct MoodPicker: View {
    @Environment(GetOuthereStore.self) var store
    
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
                            .bold()
                            .foregroundStyle(.green)
                            .kerning(3)
                            .font(.headline)
                            .textCase(.uppercase)
                            .padding(20)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.green.opacity(0.1))
                            )
                    } else {
                    }
                }
                .padding(.bottom, 24)
                
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(Mood.allCases) { mood in
                        Button {
                            store.selectedMood = mood
                        } label: {
                            Text(mood.emoji)
                                .font(.system(size: 40))
                                .padding()
                                .background(store.selectedMood == mood ? Color.green.opacity(0.2) : Color.clear)
                                .clipShape(Circle())
                        }
                        
                    }
                }
                
                Spacer()
                
                if store.selectedMood != nil {
                    Button("Get Outhere") {
                        store.navigateToMissions = true
                        store.showMission()
                    }
                    .foregroundStyle(.white)
                    .bold()
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.green)
                    )
                    .opacity(0.8)
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
