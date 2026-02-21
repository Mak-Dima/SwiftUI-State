//
//  VIewModifiers.swift
//  SwiftUI-State
//
//  Created by Dmytro Maksiutenko on 2026-02-19.
//

import SwiftUI

struct SwingTextAnimationStartLeft: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .phaseAnimator([true, false]) { content, phase in
                content.rotationEffect(phase ? .degrees(-1) : .degrees(1))
            } animation: { phase in
                phase ? .bouncy(duration: 0.5) : .spring(duration: 0.5)
            }
    }
}

struct SwingTextAnimationStartRight: ViewModifier {
    func body(content: Content) -> some View {
        content
            .phaseAnimator([true, false]) { content, phase in
                content.rotationEffect(phase ? .degrees(-1) : .degrees(1))
            }
    }
}

struct PulseFrameAnimation: ViewModifier {
    var color: Color
    var width: CGFloat
    var height: CGFloat
    
    func body(content: Content) -> some View {
        content
            .phaseAnimator([true, false]) {content, phase in
                content
                    .frame(
                        width: phase ? self.width : self.width - 10,
                        height: phase ? self.height : self.height - 10
                    )
                    .shadow(color: self.color, radius: phase ? 5 : 20)
            }
    }
}
