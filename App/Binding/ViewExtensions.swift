//
//  ViewExtensions.swift
//  SwiftUI-State
//
//  Created by Dmytro Maksiutenko on 2026-02-19.
//

import SwiftUI

extension View {
    func swingTextAnimationStartLeft() -> some View {
        self.modifier(SwingTextAnimationStartLeft())
    }
}

extension View {
    func swingTextAnimationStartRight() -> some View {
        self.modifier(SwingTextAnimationStartRight())
    }
}

extension View {
    func pulseFrameAnimation(color: Color, width: CGFloat, height: CGFloat) -> some View {
        self.modifier(
            PulseFrameAnimation(color: color, width: width, height: height)
        )
    }
}
