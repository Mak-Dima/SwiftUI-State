//
//  BindingBlankView.swift
//  SwiftUI-State
//
//  Created by Dmytro Maksiutenko on 2026-02-16.
//

import SwiftUI

struct BindingBlankView: View {
    @State var bindableData: String = "Parent Data"
    
    var body: some View {
        Text(bindableData)
    }
}

#Preview {
    BindingBlankView()
}
