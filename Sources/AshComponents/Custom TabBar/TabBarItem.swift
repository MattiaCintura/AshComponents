//
//  TabBarItem.swift
//  AshCustom
//
//  Created by Mattia Cintura on 19/10/21.
//

import Foundation
import SwiftUI

public struct TabBarItem: Equatable, Hashable {
    var iconName: String
    var title: String
    var color: Color
    
    public init(iconName: String, title: String, color: Color) {
        self.iconName = iconName
        self.title = title
        self.color = color
    }
}
