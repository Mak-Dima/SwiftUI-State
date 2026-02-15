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
            Tab {
                StateBlankView()
                    .id(resetTocken)
            } label: {
                Text("Data")
            }
            
            Tab {
                EmptyBlankView(tocken: $resetTocken)
            } label: {
                Text("Reset")
            }
        }
    }
}

#Preview {
    NavigationStateBlankView()
}
