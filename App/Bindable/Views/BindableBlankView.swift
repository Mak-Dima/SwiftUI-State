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
            VStack(alignment: .center, spacing: 40) {
                HStack(alignment: .center, spacing: 20) {
                    Spacer()
                    NavigationLink("Edit") {
                        BindableBlankEditView(viewModel: viewModel)
                    }
                }
                .padding([.trailing], 40)
                .padding([.top, .bottom], 80)
                
                Text(viewModel.data.id.uuidString)
                    .overlayTitleBadge("ID")
                Text(viewModel.data.name)
                    .overlayTitleBadge("Name", offsetX: -70)
                Text(String(viewModel.data.version))
                    .overlayTitleBadge("Version", offsetX: -80)
                Text(String(viewModel.data.subversion))
                    .overlayTitleBadge("Subversion", offsetX: -90)
                Text(viewModel.data.inUse ? "In use" : "Not in use")
                    .overlayTitleBadge("Used", offsetX: -70)
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .buttonStyle(.glass)
            .buttonBorderShape(.roundedRectangle)
            .background {
                RadialGradient(colors: [.pink.mix(with: .red, by: 0.9), .indigo], center: .center, startRadius: 50, endRadius: 500)
            }
            .ignoresSafeArea()
            .task {
                await self.$viewModel.wrappedValue.prepareData()
            }
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
