import SwiftUI
import Lottie

struct PopUpView: View {
    @Environment(SetpOutStore.self) var store
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            VStack(spacing: 16) {
                LottieView(animation: .named("DoneAnimation"))
                    .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                    .frame(width: 150, height: 150)
                Text("Mission accomplished")
                    .foregroundStyle(.gray)
                    .textCase(.uppercase)
                    .font(.body)
                    .kerning(4)
                Text("+ \(store.dailyMission?.point ?? 0) Points!")
                    .bold()
                    .font(.largeTitle)
                    .foregroundStyle(.green)
            }
            .frame(width: 320, height: 400)
            .padding()
            .roundedBackground(color: colorScheme == .dark ? .white : .gray)
        }
    }
}

#Preview {
    let store = SetpOutStore()
    PopUpView()
        .environment(store)
}
