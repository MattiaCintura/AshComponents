//
//  AshFloatingTabBarContainerView.swift
//  
//
//  Created by Mattia Cintura on 15/05/22.
//

import SwiftUI

public struct AshFloatingTabBarContainerView<Content: View>: View {
    
    @Binding var selection: TabBarItem
    let content: Content
    @State private var tabs: Array<TabBarItem> = []
    
    public init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content) {
        self._selection = selection
        self.content = content()
    }
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            content
                .ignoresSafeArea()

            AshFloatingTabBar(tabs: tabs, selection: $selection, localSelection: selection)
        }
        .onPreferenceChange(AshTabBarItemPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

struct AshFloatingTabBarContainerView_Previews: PreviewProvider {
    
    static let tabs: Array<TabBarItem> = [
        TabBarItem(iconName: "home", title: "Home", color: .cyan)
    ]
    
    static var previews: some View {
        AshFloatingTabBarContainerView(selection: .constant(tabs.first!)) {
            Color.red
        }
    }
}
