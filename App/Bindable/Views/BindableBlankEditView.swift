//
//  BindableBlankChildView.swift
//  SwiftUI-State
//
//  Created by Dmytro Maksiutenko on 2026-02-21.
//

import SwiftUI

struct BindableBlankEditView: View {
    
    @Bindable var viewModel: BindableViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 3) {
            Text("Name")
            TextField("name", text: $viewModel.data.name)
            Text("Version")
            TextField("version", value: $viewModel.data.version, format: .number)
            Text("Subversion")
            TextField("subversion", value: $viewModel.data.subversion, format: .number)
            Text("Used")
            Toggle("", isOn: $viewModel.data.inUse).labelsHidden()
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
    @Previewable @State var vm = BindableViewModel(
        BindableModel(
            id: UUID(),
            name: "Test",
            version: 1,
            subversion: 0,
            inUse: false
        )
    )
    BindableBlankEditView(viewModel: vm)
}
