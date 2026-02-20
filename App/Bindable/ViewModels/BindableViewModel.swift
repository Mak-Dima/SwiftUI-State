//
//  BindableViewModel.swift
//  SwiftUI-State
//
//  Created by Dmytro Maksiutenko on 2026-02-20.
//

import Foundation

@Observable class BindableViewModel {
    var data: BindableModel
    var ready: Bool = false
    var isLoading: Bool = true
    
    init(_ data: BindableModel) {
        self.data = data
    }
    
    func prepareData() async {
        do {
            try await Task.sleep(for: .seconds(5))
            self.data = BindableModel(
                id: UUID(),
                name: "Test",
                version: 1,
                subversion: 0,
                inUse: false
            )
            self.ready = true
            self.isLoading = false
        } catch {
            self.isLoading = true
        }
    }
}
