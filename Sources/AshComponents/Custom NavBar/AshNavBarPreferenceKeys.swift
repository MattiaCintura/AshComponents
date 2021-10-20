//
//  AshNavBarPreferenceKeys.swift
//  AshCustom
//
//  Created by Mattia Cintura on 19/10/21.
//

import Foundation
import SwiftUI

public struct AshNavBarTitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

public struct AshNavBarSubitlePreferenceKey: PreferenceKey {
    
    static var defaultValue: String? = nil
    
    static func reduce(value: inout String?, nextValue: () -> String?) {
        value = nextValue()
    }
}

public struct AshNavBarBackButtonHiddenPreferenceKey: PreferenceKey {
    
    static var defaultValue: Bool = false
    
    static func reduce(value: inout Bool, nextValue: () -> Bool) {
        value = nextValue()
    }
}

public struct AshNavBarBackgroundColorPreferenceKey: PreferenceKey {
    static var defaultValue: Color? = nil
    
    static func reduce(value: inout Color?, nextValue: () -> Color?) {
        value = nextValue()
    }
}

public struct AshNavBarForegroundColorPreferenceKey: PreferenceKey {
    static var defaultValue: Color? = nil
    
    static func reduce(value: inout Color?, nextValue: () -> Color?) {
        value = nextValue()
    }
}

public struct AshNavBarIconNamePreferenceKey: PreferenceKey {
    static var defaultValue: String? = nil
    
    static func reduce(value: inout String?, nextValue: () -> String?) {
        value = nextValue()
    }
}

extension View {

    public func customNavigationTitle(_ title: String) -> some View {
        preference(key: AshNavBarTitlePreferenceKey.self, value: title)
    }
    
    public func customNavigationSubtitle(_ subtitle: String?) -> some View {
        preference(key: AshNavBarSubitlePreferenceKey.self, value: subtitle)
    }
    
    public func customNavigationBackButtonHidden(_ hidden: Bool) -> some View {
        preference(key: AshNavBarBackButtonHiddenPreferenceKey.self, value: hidden)
    }
    
    public func customNavigationBackgroundColor(_ color: Color?) -> some View {
        preference(key: AshNavBarBackgroundColorPreferenceKey.self, value: color)
    }
    
    public func customNavigationForegroundColor(_ color: Color?) -> some View {
        preference(key: AshNavBarForegroundColorPreferenceKey.self, value: color)
    }
    
    public func customNavigationIcon(_ systemName: String?) -> some View {
        preference(key: AshNavBarIconNamePreferenceKey.self, value: systemName)
    }
    
    public func customNavigationItem(title: String = "", subtitle: String? = nil, backButtonHidden: Bool = false, backgroundColor: Color? = nil, foregroundColor: Color? = nil, iconName: String? = nil) -> some View {
        self
            .customNavigationTitle(title)
            .customNavigationSubtitle(subtitle)
            .customNavigationBackButtonHidden(backButtonHidden)
            .customNavigationBackgroundColor(backgroundColor)
            .customNavigationForegroundColor(foregroundColor)
            .customNavigationIcon(iconName)
    }
}
