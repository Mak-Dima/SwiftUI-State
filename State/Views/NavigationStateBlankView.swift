//
//  NavigationStateBlankView.swift
//  SwiftUI-State
//
//  Created by Dmytro Maksiutenko on 2026-02-15.
//

import SwiftUI

struct NavigationStateBlankView: View {
    @State private var resetTocken = UUID()
    
    var body: some View {
        TabView {
            Tab("Data", systemImage: "book") {
                StateBlankView()
                    .id(resetTocken)
            }
                
            Tab("Reset", systemImage: "trash") {
                EmptyBlankView(tocken: $resetTocken)
            }
        }
    }
}

#Preview {
    NavigationStateBlankView()
}
