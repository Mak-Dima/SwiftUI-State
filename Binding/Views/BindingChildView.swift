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
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 20) {
                Text(data ?? "No data")
                Text(data ?? "No data")
            }
            .ignoresSafeArea()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background( Color.green.mix(with: Color.gray, by: 0.7) )
            .fontWeight(.bold)
            .fontDesign(.monospaced)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 150)
                .frame(width: 300, height: 300)
                .foregroundStyle (
                    RadialGradient(colors: [.white, .yellow], center: .center, startRadius: .zero, endRadius: 200).opacity(0.1)
                )
                .shadow(color: .white,radius: 15)
        }
    }
}

#Preview {
    @Previewable @State var text: String? = "Preview Data"
    // When applaying $ prefix to a @State property return its projectedValue.
    BindingChildView(data: $text)
}
