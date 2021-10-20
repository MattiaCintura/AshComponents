//
//  TabBarItem.swift
//  AshCustom
//
//  Created by Mattia Cintura on 19/10/21.
//

import Foundation
import SwiftUI

public enum TabBarItem: Hashable {
    case home, favorite, profile, settings, cart, messages
    
    var iconName: String {
        switch self {
        case .home:
            return "house"
        case .favorite:
            return "heart"
        case .profile:
            return "person"
        case .settings:
            return "gear"
        case .cart:
            return "cart"
        case .messages:
            return "message"
        }
    }
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .favorite:
            return "Favorites"
        case .profile:
            return "Profile"
        case .settings:
            return "Settings"
        case .cart:
            return "Cart"
        case .messages:
            return "Messages"
        }
    }
    
    var color: Color {
        switch self {
        case .home:
            return Color.blue
        case .favorite:
            return Color(.systemPink)
        case .profile:
            return Color.purple
        case .settings:
            return Color.gray
        case .cart:
            return Color.mint
        case .messages:
            return Color.green
        }
    }
}

