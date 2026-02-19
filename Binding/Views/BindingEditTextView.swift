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
            TextField("Enter Text", text: $draftData)
                .submitLabel(.return)
                .onSubmit {
                    parentData = draftData
                    draftData.removeAll()
                }

            Text(parentValue.wrappedValue ?? "No Value")
            TextField("Enter Text", text: $draftValue)
                .submitLabel(.return)
                .onSubmit {
                    parentValue.wrappedValue = draftValue
                    draftValue.removeAll()
                }
            
        }
        .padding()
    }
}

#Preview {
    @Previewable @State var value: String? = "Preview Text"
    @Previewable @State var data: String? = "Preview Text"
    BindingEditTextView(parentData: $data, parentValue: $value)
}
