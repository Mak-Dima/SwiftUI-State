//
//  BlankView.swift
//  SwiftUI-State
//
//  Created by Dmytro Maksiutenko on 2026-02-13.
//

import SwiftUI

struct StateBlankView: View {
    @State var data: String
    @State private var draft: String = ""
    @State private var animationTrigger: Bool = false
    
    var body: some View {
        VStack(alignment: .center ,spacing: 20) {
            Text(data)
                .keyframeAnimator(initialValue: 1.0, trigger: animationTrigger) { content, value in
                    content
                        .scaleEffect(x: value, y: value)
                } keyframes: { _ in
                    KeyframeTrack {
                        LinearKeyframe(2.0, duration: 0.5)
                        LinearKeyframe(1.0, duration: 0.5)
                    }
                }
            TextField("Enter new data", text: $draft)
                .submitLabel(.return)
                .onSubmit {
                    data = draft
                    animationTrigger.toggle()
                    draft.removeAll()
                }
                .border(.secondary)
        }
        .padding(20)
    }
}

#Preview {
    StateBlankView(data: "data")
}

