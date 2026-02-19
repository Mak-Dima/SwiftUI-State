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
        NavigationStack{
            ZStack {
                Color.blue.mix(with: .green, by: 0.3)
                
                VStack {
                    Text(bindableData ?? "No Data")
                        .swingTextAnimationStartRight()
                    Text(bindableValue.wrappedValue ?? "No Data")
                        .swingTextAnimationStartLeft()

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
                                .pulseFrameAnimation(color: .yellow, width: 150, height: 100)
                            Text("Tap")
                                .foregroundStyle(Color.white)
                        }
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
