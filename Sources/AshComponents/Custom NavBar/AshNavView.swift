//
//  AshNavView.swift
//  AshCustom
//
//  Created by Mattia Cintura on 19/10/21.
//

import SwiftUI

public struct AshNavView<Content: View>: View {
    
    let content: Content
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    public var body: some View {
        NavigationView {
            AshNavBarContainerView {
                content
            }
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct AshNavView_Previews: PreviewProvider {
    static var previews: some View {
        AshNavView {
            Color.orange.ignoresSafeArea()
        }
    }
}
