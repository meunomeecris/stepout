import SwiftUI

struct TitleView: View {
    var label: String
    var body: some View {
        Text(label)
            .multilineTextAlignment(.center)
            .font(.title)
            .bold()
            .padding(.top, 24)
    }
}
