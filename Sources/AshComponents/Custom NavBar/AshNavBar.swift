//
//  AshNavBar.swift
//  AshCustom
//
//  Created by Mattia Cintura on 19/10/21.
//

import SwiftUI

public struct AshNavBar: View {
    
    @Environment(\.presentationMode) var presentationMode
    let showBackButton: Bool
    let backgroundColor: Color
    let foregroundColor: Color
    let iconName: String?
    let title: String
    let subTitle: String?
    
    public var body: some View {
        HStack {
            if showBackButton {
                backButton
                    .padding(.horizontal, 5)
            }
            titleSection
            Spacer()
        }
        .padding()
        .accentColor(.white)
        .foregroundColor(foregroundColor)
        .font(.headline)
        .background(backgroundColor.ignoresSafeArea(edges: .top))
    }
}

struct AshNavBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AshNavBar(showBackButton: false, backgroundColor: .red, foregroundColor: .white, iconName: "house", title: "Home", subTitle: "This is the home view of your app")
            Spacer()
        }
    }
}

extension AshNavBar {
    
    private var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.left")
        }
    }
    
    private var titleSection: some View {
        VStack {
            HStack {
                if let iconName = iconName {
                    Image(systemName: iconName)
                        .font(.largeTitle)
                }
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    if let subTitle = subTitle {
                        Text(subTitle)
                            .font(.subheadline)
                    }
                }
            }
        }
    }
}
