//
//  RoundedBackgrounStyle.swift
//  StepOut
//
//  Created by Cris Messias on 09/07/25.
//

import SwiftUI

struct RoundedBackgroundStyle: ViewModifier {
    let color: Color
    let cornerRadius: CGFloat
    let opacity: Double

    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(color)
                    .opacity(opacity)
            )
    }
}

extension View {
    func roundedBackground(color: Color = .gray, cornerRadius: CGFloat = 20, opacity: Double = 0.1) -> some View {
        self.modifier(RoundedBackgroundStyle(color: color, cornerRadius: cornerRadius, opacity: opacity))
    }
}

#Preview {
    VStack {
        Text("Test")
            .roundedBackground(color: .accentColor)
    }
}
