//
//  ViewExtensions.swift
//  SwiftUI-State
//
//  Created by Dmytro Maksiutenko on 2026-02-21.
//

import SwiftUI

extension View {
    func overlayTitleBadge(_ title: String, offsetX: CGFloat = -50, width: CGFloat = 100) -> some View {
        self.modifier(OverlayTitleBadge(title, offsetX: offsetX, width: width))
    }
}
