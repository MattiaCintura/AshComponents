//
//  AshNavBarContainerView.swift
//  AshCustom
//
//  Created by Mattia Cintura on 19/10/21.
//

import SwiftUI

public struct AshNavBarContainerView<Content: View>: View {
    
    let content: Content
    @State private var showBackButton: Bool = true
    @State private var backgroundColor: Color? = nil
    @State private var foregroundColor: Color? = nil
    @State private var title: String = ""
    @State private var subTitle: String? = nil
    @State private var iconName: String? = nil
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    public var body: some View {
        VStack(spacing: 0) {
            AshNavBar(showBackButton: showBackButton, backgroundColor: backgroundColor ?? .clear, foregroundColor: foregroundColor ?? .black, iconName: iconName, title: title, subTitle: subTitle)
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onPreferenceChange(AshNavBarTitlePreferenceKey.self) { value in
            self.title = value
        }
        .onPreferenceChange(AshNavBarSubitlePreferenceKey.self) { value in
            self.subTitle = value
        }
        .onPreferenceChange(AshNavBarBackButtonHiddenPreferenceKey.self) { value in
            self.showBackButton = !value
        }
        .onPreferenceChange(AshNavBarBackgroundColorPreferenceKey.self) { value in
            self.backgroundColor = value
        }
        .onPreferenceChange(AshNavBarForegroundColorPreferenceKey.self) { value in
            self.foregroundColor = value
        }
        .onPreferenceChange(AshNavBarIconNamePreferenceKey.self) { value in
            self.iconName = value
        }
    }
}

struct AshNavBarContainerView_Previews: PreviewProvider {
    static var previews: some View {
        AshNavBarContainerView {
            ZStack {
                Color.green.ignoresSafeArea()
                
                Text("Hello, world!")
                    .foregroundColor(.white)
            }
            .customNavigationTitle("Title")
            .customNavigationBackgroundColor(.red)
            .customNavigationForegroundColor(.white)
        }
    }
}
