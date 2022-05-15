//
//  AshFloatingTabBar.swift
//  
//
//  Created by Mattia Cintura on 15/05/22.
//

import SwiftUI

public struct AshFloatingTabBar: View {
    
    let tabs: Array<TabBarItem>
    @Binding var selection: TabBarItem
    @Namespace private var namespace
    @State var localSelection: TabBarItem
    @Environment(\.colorScheme) var colorScheme
    
    public var body: some View {
        floatingTabBar
            .onChange(of: selection) { value in
                withAnimation(.easeInOut) {
                    localSelection = value
                }
            }
    }
}

struct AshFloatingTabBar_Previews: PreviewProvider {
    
    static let tabs: Array<TabBarItem> = [
        TabBarItem(iconName: "house", title: "Home", color: .accentColor)
    ]
    
    static var previews: some View {
        VStack {
            Spacer()
            AshFloatingTabBar(tabs: tabs, selection: .constant(tabs.first!), localSelection: tabs.first!)
        }
    }
}

extension AshFloatingTabBar {
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
        .background(
            ZStack {
                if localSelection == tab {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(tab.color.opacity(0.2))
                        .matchedGeometryEffect(id: "background_rectangle", in: namespace)
                }
            }
        )
    }
    
    private var floatingTabBar: some View {
        HStack {
            ForEach(tabs, id: \.self) { tab in
                tabView(tab: tab)
                    .onTapGesture {
                        switchToTab(tab: tab)
                    }
            }
        }
        .padding(6)
        .background(
            colorScheme == .light ? Color.white.ignoresSafeArea(edges: .bottom) : Color.black.ignoresSafeArea(edges: .bottom))
        .cornerRadius(10)
        .shadow(color: colorScheme == .light ? Color.black.opacity(0.2) : Color.gray.opacity(0.15), radius: 10, x: 0, y: 5)
        .padding(.horizontal)
    }
    
    private func switchToTab(tab: TabBarItem) -> Void {
            selection = tab
    }
}
