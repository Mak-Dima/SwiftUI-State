//
//  StateBlankIOService.swift
//  SwiftUI-State
//
//  Created by Dmytro Maksiutenko on 2026-02-13.
//

import Foundation

class StateBlackIOService {
    func read() -> StateBlankModel {
        let data: StateBlankModel = .init(ID: "1", data: "StateBlank", description: "StateBlank")
        
        return data
    }
    
    func write(_ stateBlank: StateBlankModel) throws {
        
    }
}
