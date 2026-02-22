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
        switch viewModel.state {
        case .loading:
            ProgressView()
                .task {
                    await viewModel.prepareData()
                }
        case .loaded:
            NavigationStack {
                VStack(alignment: .center, spacing: 40) {
                    HStack(alignment: .center, spacing: 20) {
                        Spacer()
                        NavigationLink("Edit") {
                            if viewModel.model == nil {
                                Text("No data to edit")
                            } else {
                                BindableBlankEditView(model: Binding($viewModel.model)!)
                            }
                        }
                    }
                    .padding([.trailing], 40)
                    .padding([.top, .bottom], 80)
                    
                    Text(viewModel.model?.id.uuidString ?? "Unknown")
                        .overlayTitleBadge("ID")
                    Text(viewModel.model?.name ?? "Unknown")
                        .overlayTitleBadge("Name", offsetX: -70)
                    Text(String(viewModel.model?.version ?? 0))
                        .overlayTitleBadge("Version", offsetX: -80)
                    Text(String(viewModel.model?.subversion ?? 0))
                        .overlayTitleBadge("Subversion", offsetX: -90)
                    Text(viewModel.model?.inUse ?? false ? "In use" : "Not in use")
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
            }
        }
    }
}

#Preview {
    @Previewable @State var vm = BindableViewModel()
    BindableBlankView(viewModel: vm)
}
