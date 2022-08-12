//
//  NavigationListModel.swift
//  Social-Network-Challenge
//
//  Created by Robson Lima Lopes on 11/08/22.
//

import SwiftUI

struct ItemNavigationListComponent{
    let route: AnyView
    let systemName: String
    let title: String
    
    static func buildItem(itemProfile: ItemNavigationListComponent) -> some View{
        
        return NavigationLink{itemProfile.route}
            label:{
                HStack{
                    Image(systemName: itemProfile.systemName)
                        .foregroundColor(Color.accentColor)
                    Text(itemProfile.title)
                }
            }
    }
}



