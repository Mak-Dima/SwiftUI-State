//
//  ViewModifiers.swift
//  SwiftUI-State
//
//  Created by Dmytro Maksiutenko on 2026-02-21.
//

import SwiftUI

struct OverlayTitleBadge: ViewModifier {
    private var text: String
    private var offsetX: CGFloat
    private var width: CGFloat
    
    init(_ text: String, offsetX: CGFloat, width: CGFloat) {
        self.text = text
        self.offsetX = offsetX
        self.width = width
    }
    
    func body(content: Content) -> some View {
        content
            .overlay(alignment: .topLeading){
                Text(self.text)
                    .frame(width: self.width)
                    .shadow(color: .blue, radius: 10)
                    .offset(x: self.offsetX, y: -20)
                    .background {
                        RoundedRectangle(cornerRadius: 5)
                            .foregroundStyle(.clear)
                    }
                    .foregroundStyle(.white)
            }
    }
}
