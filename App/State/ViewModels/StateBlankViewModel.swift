//
//  StateBlankViewModel.swift
//  SwiftUI-State
//
//  Created by Dmytro Maksiutenko on 2026-02-13.
//

import Foundation
internal import Combine

// Swift 5.9 Apple has restructured how reactive dependencies are handled.
// ObservableObject is becoming a legacy pattern.
// The modern approach is use @Observable macro.
class StateBlankViewModel: ObservableObject {
    @Published var stateBlank: StateBlankModel
    
    init(stateBlank: StateBlankModel) {
        self.stateBlank = stateBlank
    }
}
