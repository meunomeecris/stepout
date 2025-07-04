import SwiftUI

struct Home: View {
    @Environment(GetOuthereStore.self) var store
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Welcome(store: _store)
                MissionDashboard(store: _store)
                MyMood(store: _store)
                MyMission(store: _store)
            }
            .padding(16)
        }
    }
}

#Preview {
    let store = GetOuthereStore()
    Home()
        .environment(store)
}

struct Welcome: View {
    @Environment(GetOuthereStore.self) var store
    @AppStorage("firstName") var firstName = ""
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Get Outhere")
                    .textCase(.uppercase)
                    .opacity(0.8)
                    .kerning(7)
                    .font(.title3)
                    .bold()
                    .padding(.bottom,16)
                
                HStack {
                    Spacer()
                    Text(store.greeting())
                        .font(.title2)
                        .opacity(0.8)
                    
                    Text("\(firstName.capitalized).")
                        .font(.largeTitle)
                        .foregroundStyle(.green)
                        .bold()
                    Spacer()
                }
                
                Text(store.currentDate())
                    .textCase(.uppercase)
                    .font(.caption)
                    .kerning(2)
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.gray.opacity(0.08))
            )
        }
    }
}









