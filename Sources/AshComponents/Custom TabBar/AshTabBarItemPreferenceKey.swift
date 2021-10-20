//
//  AshTabBarItemPreferenceKey.swift
//  AshCustom
//
//  Created by Mattia Cintura on 19/10/21.
//

import Foundation
import SwiftUI

public struct AshTabBarItemPreferenceKey: PreferenceKey {

    static var defaultValue: Array<TabBarItem> = []
    
    static func reduce(value: inout Array<TabBarItem>, nextValue: () -> Array<TabBarItem>) {
        value += nextValue()
    }
}

public struct TabBarItemViewModifier: ViewModifier {
    
    let tab: TabBarItem
    @Binding var selection: TabBarItem
    
    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1.0 : 0.0)
            .preference(key: AshTabBarItemPreferenceKey.self, value: [tab])
    }
}

extension View {
    
    public func customTabBarItem(tab: TabBarItem, selection: Binding<TabBarItem>) -> some View {
        modifier(TabBarItemViewModifier(tab: tab, selection: selection))
    }
}
