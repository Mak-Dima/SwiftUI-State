//
//  BindableBlankView.swift
//  SwiftUI-State
//
//  Created by Dmytro Maksiutenko on 2026-02-20.
//

import SwiftUI

struct BindableBlankView: View {
    
    @State var viewModel: BindableViewModel
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center, spacing: 20) {
                HStack(alignment: .center, spacing: 20) {
                    Spacer()
                    NavigationLink("Edit") {
                        
                    }
                }
                .padding([.trailing], 40)
                .padding([.top, .bottom], 80)
                
                Text(viewModel.data.id.uuidString)
                Text(viewModel.data.name)
                Text(String(viewModel.data.version))
                Text(String(viewModel.data.subversion))
                Text(viewModel.data.inUse ? "In use" : "Not in use")
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .buttonStyle(.glass)
            .buttonBorderShape(.roundedRectangle)
            .background {
                RadialGradient(colors: [.pink.mix(with: .red, by: 0.9), .indigo], center: .center, startRadius: 50, endRadius: 500)
            }
            .ignoresSafeArea()
        }
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
    
    BindableBlankView(viewModel: vm)
}
