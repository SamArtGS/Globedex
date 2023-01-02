//
//  ContentView.swift
//  Shared
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-10-31.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      #if os(iOS)
        switch UIDevice.current.userInterfaceIdiom {
        case .pad:
            SliptView()
        case .phone:
            TabBarView()
        default:
            TabBarView()
        }
      #endif
      #if os(macOS)
        SidebarView()
      #endif
    }
}
