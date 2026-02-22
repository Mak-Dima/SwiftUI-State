//
//  BindableBlankChildView.swift
//  SwiftUI-State
//
//  Created by Dmytro Maksiutenko on 2026-02-21.
//

import SwiftUI

struct BindableBlankEditView: View {
    
    @Binding var model: BindableModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            Text("Name")
            TextField("name", text: $model.name)
            Text("Version")
            TextField("version", value: $model.version, format: .number)
            Text("Subversion")
            TextField("subversion", value: $model.subversion, format: .number)
            Text("Used")
            Toggle("", isOn: $model.inUse).labelsHidden()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .textFieldStyle(.roundedBorder)
        .background{
            LinearGradient(colors: [.orange.opacity(0.3), .clear], startPoint: .topLeading, endPoint: .bottomTrailing)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    @Previewable @State var m = BindableModel(
        id: UUID(), name: "test", version: 1, subversion: 0, inUse: false
    )
    BindableBlankEditView(model: $m)
}
