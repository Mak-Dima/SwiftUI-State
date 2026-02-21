//
//  SwiftUI_StateApp.swift
//  SwiftUI-State
//
//  Created by Dmytro Maksiutenko on 2026-02-12.
//

import SwiftUI

@main
struct SwiftUI_State: App {
    var body: some Scene {
        WindowGroup {
//            NavigationStateBlankView()
//            BindingBlankView()
            BindableBlankView(
                viewModel: BindableViewModel(
                    BindableModel(
                        id: UUID(),
                        name: "Data from ViewModel",
                        version: 1,
                        subversion: 0,
                        inUse: false
                    )
                )
            )
        }
    }
}
