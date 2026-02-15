//
//  BlankView.swift
//  SwiftUI-State
//
//  Created by Dmytro Maksiutenko on 2026-02-13.
//

import SwiftUI

struct StateBlankView: View {
    // When use @State attribute SwitUI does work for you.
    // Call corresponding State<Value> constructor.
    // Every time Struct recriated during re-render process
    // SwiftUI will identifies the property by its identity(View type, position in the tree, .id())
    // but ignore initialValue and reuses the value existing in storage cell.
    // Storage cell is created in the heap.
    @State private var draft: String = ""
    @State private var animationTrigger: Bool = false
    
    // This is actualy what @State wrapper do on first time storage cell created.
    // This is just stored property, so it will be initialized again with initialValue
    // in case user move to another view and return back to this one, and every re-render
    // in this case every time animationTrigger cause animatio.
    var data: State<String> = State<String>(initialValue: "initial data`")
    
    var body: some View {
        VStack(alignment: .center ,spacing: 20) {
            //wrappedWalue is a property provides access to the value's data.
            Text(data.wrappedValue)
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
                    //wrappedWalue is a property provides access to the value's data.
                    data.wrappedValue = draft
                    animationTrigger.toggle()
                    draft.removeAll()
                }
                .border(.secondary)
        }
        .padding(20)
    }
}

#Preview {
    StateBlankView(data: State<String>(initialValue: "initial preview data"))
}

