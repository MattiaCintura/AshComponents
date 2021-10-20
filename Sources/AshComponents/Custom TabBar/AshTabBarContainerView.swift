//
//  AshCustomTabBarContainerView.swift
//  AshCustom
//
//  Created by Mattia Cintura on 18/10/21.
//

import SwiftUI

public struct AshTabBarContainerView<Content: View>: View {
    
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

            AshTabBar(tabs: tabs, selection: $selection, localSelection: selection)
        }
        .onPreferenceChange(AshTabBarItemPreferenceKey.self) { value in
            self.tabs = value
        }
    }
}

struct AshTabBarContainerView_Previews: PreviewProvider {
    
    static let tabs: Array<TabBarItem> = [
        .home, .favorite, .profile
    ]
    
    static var previews: some View {
        AshTabBarContainerView(selection: .constant(tabs.first!)) {
            Color.red
        }
    }
}
