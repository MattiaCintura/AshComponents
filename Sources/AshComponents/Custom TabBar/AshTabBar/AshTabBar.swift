//
//  AshCustomTabBar.swift
//  AshCustom
//
//  Created by Mattia Cintura on 18/10/21.
//

import SwiftUI

public struct AshTabBar: View {
    
    let tabs: Array<TabBarItem>
    @Binding var selection: TabBarItem
    @Namespace private var namespace
    @State var localSelection: TabBarItem
    @Environment(\.colorScheme) var colorScheme
    
    public var body: some View {
        tabBar
            .onChange(of: selection) { value in
                withAnimation(.easeInOut) {
                    localSelection = value
                }
            }
    }
}

struct AshTabBar_Previews: PreviewProvider {
    
    static let tabs: Array<TabBarItem> = [
        TabBarItem(iconName: "house", title: "Home", color: .accentColor)
    ]
    
    static var previews: some View {
        VStack {
            Spacer()
            AshTabBar(tabs: tabs, selection: .constant(tabs.first!), localSelection: tabs.first!)
        }
    }
}


extension AshTabBar {
    
    private func tabView(tab: TabBarItem) -> some View {
        VStack {
            Image(systemName: tab.iconName)
                .font(.subheadline)
            Text(tab.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .foregroundColor(localSelection == tab ? tab.color : Color.gray)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .background(localSelection == tab ? tab.color.opacity(0.2) : Color.clear)
        .cornerRadius(10)
    }
    
    private var tabBar: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
    }
    
    private func switchToTab(tab: TabBarItem) -> Void {
            selection = tab
    }
}

