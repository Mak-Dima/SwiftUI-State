//
//  BindingBlankView.swift
//  SwiftUI-State
//
//  Created by Dmytro Maksiutenko on 2026-02-16.
//

import SwiftUI

struct BindingBlankView: View {
    @State var bindableData: String? = "Parent Data"
    
    // This is how it works without syntactical shugar.
    var bindableValue: State<String?> = .init(wrappedValue: "Parent Value")
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.blue.mix(with: .green, by: 0.3)
                
                NavigationLink {
                    BindingChildView(
                        data: $bindableData,
                        // Manual call of .projectedValue instead of $ sign
                        value: bindableValue.projectedValue
                    )
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundStyle(Color.orange)
                            .phaseAnimator([true, false]) { content, phase in
                                content.frame(maxWidth: phase ? 200 : 190, maxHeight: 100)
                            }
                        
                        Text("Tap")
                            .foregroundStyle(Color.white)
                    }
                }
            }
            .ignoresSafeArea()
        }
        .font(Font.largeTitle.monospacedDigit())
    }
}

#Preview {
    BindingBlankView()
}
