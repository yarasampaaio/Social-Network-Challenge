//
//  PostsComponents.swift
//  Social-Network-Challenge
//
//  Created by Robson Lima Lopes on 12/08/22.
//

import SwiftUI

struct PostsComponents{
    
    static func addPost()-> some View{
        return NavigationLink{AddPostView()}label:{
            HStack{
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.accentColor)
                    .font(.system(size: 20))
                Text("Add Post")
            }.frame(
                width:SizesComponents.widthFirst,
                alignment: .trailing
            )
        }
    }
}
