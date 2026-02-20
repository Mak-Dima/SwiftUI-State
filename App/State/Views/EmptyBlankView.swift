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
        VStack(alignment: .center, spacing: 100) {
            Text("No any data.")
            
            Button("Reset") {
                tocken = UUID()
            }
            .shadow(color: Color.black ,radius: 0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(LinearGradient(colors: [.orange, .red], startPoint: .top, endPoint: .bottom).blur(radius: 10))
        .ignoresSafeArea()
        .buttonStyle(.bordered)
    }
}

#Preview {
    @Previewable @State var tocken = UUID(uuidString: "1") ?? UUID()
    EmptyBlankView(tocken: $tocken)
}
