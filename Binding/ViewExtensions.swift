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
