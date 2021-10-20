//
//  AshNavLink.swift
//  AshCustom
//
//  Created by Mattia Cintura on 19/10/21.
//

import SwiftUI

public struct AshNavLink<Label: View, Destination: View>: View {
    
    let label: Label
    let destination: Destination
    
    public init(destination: Destination, @ViewBuilder label: () -> Label) {
        self.destination = destination
        self.label = label()
    }
    
    public var body: some View {
        NavigationLink {
            AshNavBarContainerView {
                destination
            }
            .navigationBarHidden(true)
        } label: {
            label
        }

    }
}

struct AshNavLink_Previews: PreviewProvider {
    static var previews: some View {
        AshNavView {
            AshNavLink(destination: Text("Text")) {
                Text("Navigate")
            }
        }
    }
}
