//
//  ItemFriendListComponent.swift
//  Social-Network-Challenge
//
//  Created by Robson Lima Lopes on 12/08/22.
//

import SwiftUI

struct FriendComponent{
    
    static func builItem(userModel: UserModel)->some View{
        return HStack{
            Image("Perfil")
                .resizable()
                .cornerRadius(1000)
                .frame(width: SizesComponents.widthScreen*0.15,
                       height: SizesComponents.widthScreen*0.15, alignment: .leading)
            VStack(alignment: .leading){
                Text(userModel.name).bold()
                Text(userModel.email)
            }
        }.frame(width: SizesComponents.widthFirst, alignment: .leading)
    }
}
