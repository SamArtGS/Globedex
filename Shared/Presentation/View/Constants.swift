//
//  Constants.swift
//  Globedex
//
//  Created by Samuel Arturo Garrido Sánchez on 2022-12-26.
//

import SwiftUI

struct Constants {
    
    #if os(iOS)
    static var device = UIDevice().userInterfaceIdiom
    #endif
    
    static var columns: [GridItem] {
        #if os(iOS)
        switch device {
        case .pad:
            return [GridItem(.adaptive(minimum: 190, maximum: 190))]
        case .phone:
            return [GridItem(.adaptive(minimum: 180, maximum: 180))]
        default:
            return []
        }
        #endif
        #if os(macOS)
        return [GridItem(.adaptive(minimum: 190, maximum: 190))]
        #endif
    }
    
    static var placements: (SearchFieldPlacement, ToolbarItemPlacement, ToolbarItemPlacement) {
        #if os(iOS)
        switch device {
        case .phone:
            return (.navigationBarDrawer(displayMode: .always), .navigationBarLeading, .navigationBarTrailing)
        case .pad:
            return (.automatic, .navigationBarLeading, .navigationBarLeading)
        default:
            return (.automatic, .automatic, .automatic)
        }
        #endif
        #if os(macOS)
        return (.automatic, .automatic, .automatic)
        #endif
    }
}
