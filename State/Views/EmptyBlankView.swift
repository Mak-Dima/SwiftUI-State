//
//  EmtyBlankView.swift
//  SwiftUI-State
//
//  Created by Dmytro Maksiutenko on 2026-02-15.
//

import SwiftUI

struct EmptyBlankView: View {
    @Binding var tocken: UUID
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Text("No any data.")
            
            Button("Reset") {
                tocken = UUID()
            }
        }
    }
}

#Preview {
    @Previewable @State var tocken: UUID = UUID(uuidString: "1")!
    EmptyBlankView(tocken: $tocken)
}
