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
    
    static func buildItem(_ item: ItemNavigationListComponent) -> some View{
        
        return NavigationLink{item.route}
            label:{
                HStack{
                    Image(systemName: item.systemName)
                        .foregroundColor(Color.accentColor)
                    Text(item.title)
                }
            }
    }
}



