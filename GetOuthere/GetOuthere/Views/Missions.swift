import SwiftUI

struct Missions: View {
    @Environment(GetOuthereStore.self) var store
    
    var body: some View {
        VStack(spacing: 24) {
            Text("Today's mission")
                .multilineTextAlignment(.center)
                .font(.title)
                .bold()
                .padding(.top, 24)
            
            VStack {
                Text(store.showMission().description)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding(40)
                    .bold()
                
                Divider()
                    .foregroundStyle(.green)
                
                HStack {
                    Image(systemName: "medal.star")
                        .symbolEffect(.bounce.down.wholeSymbol, options: .nonRepeating)
                        .font(.title)
                    Text("113")
                        .font(.title)
                        .foregroundStyle(.green)
                }
                Text("Points")
                    .textCase(.uppercase)
                    .font(.caption)
                    .kerning(2)
            }
            .padding(24)
                .foregroundStyle(.green)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.green.opacity(0.1))
                )
            
            Spacer()
            
            Button("I did it!") {
                //action
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
        .padding()
    }
}

#Preview {
    let store = GetOuthereStore()
    Missions()
        .environment(store)
}
