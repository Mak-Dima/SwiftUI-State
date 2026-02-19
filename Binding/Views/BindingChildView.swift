//
//  BindableBlankView.swift
//  SwiftUI-State
//
//  Created by Dmytro Maksiutenko on 2026-02-17.
//

import SwiftUI

struct BindingChildView: View {
    // Use a binding to create a two-way connection between a property that stores data,
    // and a view that displays and changes the data.
    //
    // A binding connects a property to a source of truth stored elsewhere,
    // instead of storing data directly.
    @Binding var data: String?
    
    var value: Binding<String?>
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 20) {
                Text(data ?? "No data")
                    .swingTextAnimationStartLeft()
                Text(value.wrappedValue ?? "No data")
                    .swingTextAnimationStartRight()
            }
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background( Color.green.mix(with: Color.gray, by: 0.7) )
            .fontWeight(.bold)
            .fontDesign(.monospaced)
            
            NavigationLink {
                BindingEditTextView(
                    parentData: $data,
                    parentValue: value.projectedValue
                )
            } label: {
                RoundedRectangle(cornerRadius: 150)
                    .foregroundStyle (
                        RadialGradient(colors: [.orange, .white], center: .center, startRadius: 50, endRadius: 180).opacity(0.2)
                    )
                    .pulseFrameAnimation(color: .white, width: 300, height: 300)
            }
        }
    }
}

#Preview {
    @Previewable @State var dataText: String? = "Preview Data"
    @Previewable @State var valueText: String? = "Preview Value"
    // When applaying $ prefix to a @State property return its projectedValue.
    BindingChildView(data: $dataText, value: $valueText)
}
