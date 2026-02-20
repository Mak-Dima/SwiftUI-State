//
//  BindableModel.swift
//  SwiftUI-State
//
//  Created by Dmytro Maksiutenko on 2026-02-20.
//

import Foundation

struct BindableModel: Identifiable, Codable {
    var id: UUID
    var name: String
    var version: Int
    var subversion: Int
    var inUse: Bool
}

