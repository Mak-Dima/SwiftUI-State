//
//  BindableViewModel.swift
//  SwiftUI-State
//
//  Created by Dmytro Maksiutenko on 2026-02-20.
//

import Foundation

// Starting iOS 17, macOS 14 ... .
// SwiftUI provides a Swift-specific implementation of the observer design pattern.
// Use Observable macro instead of ObservableObject.
//
// Tracking optionals and collections, which is not possible with ObservableObject.
// Using @State, @Environment instead @StateObject and @EnvironmentObject.
// body reads observable properties, this can help improve app's performance.
@Observable class BindableViewModel {
    // The accessibility of the property determines wheather a property is observable.
    // If property accessible, but has to be untracked use @ObservationIgnored.
    var model: BindableModel?
    var state: ViewState = .loading
    
    func prepareData() async {
        do {
            try await Task.sleep(for: .seconds(5))
            self.model = BindableModel(
                id: UUID(),
                name: "Test",
                version: 1,
                subversion: 0,
                inUse: false
            )
            self.state = .loaded
        } catch {
            self.state = .loading
        }
    }
}
