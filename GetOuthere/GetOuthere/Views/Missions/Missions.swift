//import SwiftUI
//
//struct Missions: View {
//    @Environment(GetOuthereStore.self) var store
//    @AppStorage("todaysMood") var todaysMood = "Mood"
//    
//    var body: some View {
//        VStack(spacing: 24) {
//            Text("Today's mission")
//                .multilineTextAlignment(.center)
//                .font(.title)
//                .bold()
//                .padding(.top, 24)
//            
//            VStack {
//                Text(MissionData.shared.getMission(for: .bored).text)
//                    .foregroundStyle(Mood(rawValue: todaysMood)?.color ?? .yellow)
//                    .font(.title2)
//                    .multilineTextAlignment(.center)
//                    .padding(40)
//                    .bold()
//                
//                Divider()
//                    .foregroundStyle(.green)
//                
//                   VStack {
//                        Text(String(MissionData.shared.getMission(for: .angry).points))
//                            .font(.title)
//                            .foregroundStyle(Mood(rawValue: todaysMood)?.color ?? .yellow)
//                        Text("Points")
//                           .foregroundStyle(Mood(rawValue: todaysMood)?.color ?? .yellow)
//                            .textCase(.uppercase)
//                            .font(.caption)
//                            .kerning(2)
//                }
//            }
//            .padding(24)
//                .foregroundStyle(.green)
//                .background(
//                    RoundedRectangle(cornerRadius: 20)
//                        .fill(Mood(rawValue: todaysMood)?.color ?? .yellow)
//                        .opacity(0.1)
//                )
//            
//            Spacer()
//            
//            Button("I did it!") {
//                //action
//            }
//            .foregroundStyle(.white)
//            .bold()
//            .padding()
//            .background(
//                RoundedRectangle(cornerRadius: 20)
//                    .fill(Mood(rawValue: todaysMood)?.color ?? .yellow)
//            )
//            .opacity(0.8)
//        }
//        .padding()
//    }
//}
//
//#Preview {
//    let store = GetOuthereStore()
//    Missions()
//        .environment(store)
//}
