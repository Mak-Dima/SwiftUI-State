//
//  BindingEditTextView.swift
//  SwiftUI-State
//
//  Created by Dmytro Maksiutenko on 2026-02-18.
//

import SwiftUI

struct BindingEditTextView: View {
    
    @State var draftData: String = ""
    @State var draftValue: String = ""
    
    @Binding var parentData: String?
    var parentValue: Binding<String?>

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text(parentData ?? "No Value")
                .swingTextAnimationStartLeft()
            TextField("Enter Text", text: $draftData)
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.blue, lineWidth: 2)
                }
                .shadow(radius: 3)
                .submitLabel(.return)
                .onSubmit {
                    parentData = draftData
                    draftData.removeAll()
                }
                .pulseFrameAnimation(color: .blue, width: 360, height: 10)

            Text(parentValue.wrappedValue ?? "No Value")
                .swingTextAnimationStartRight()
            TextField("Enter Text", text: $draftValue)
                .background {
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.blue, lineWidth: 2)
                }
                .shadow(radius: 3)
                .submitLabel(.return)
                .onSubmit {
                    parentValue.wrappedValue = draftValue
                    draftValue.removeAll()
                }
                .pulseFrameAnimation(color: .blue, width: 360, height: 10)
            
        }
        .ignoresSafeArea()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .textFieldStyle(.roundedBorder)
        .textCase(Text.Case.uppercase)
        .background(Color.brown.mix(with: .blue, by: 0.5))
    }
}

#Preview {
    @Previewable @State var value: String? = "Preview Text"
    @Previewable @State var data: String? = "Preview Text"
    BindingEditTextView(parentData: $data, parentValue: $value)
}
