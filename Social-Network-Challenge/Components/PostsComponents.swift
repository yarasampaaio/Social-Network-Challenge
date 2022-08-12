//
//  PostsComponents.swift
//  Social-Network-Challenge
//
//  Created by Robson Lima Lopes on 12/08/22.
//

import SwiftUI

struct PostsComponents{
    static func buildPost(postModel: PostModel)-> some View{
        return VStack{
            GroupBox(label: Text(""),
                     content: {
                
                Image("image")
                    .resizable()
                    .frame(width: SizesComponents.widthSecond)
                
                Text("\n \(postModel.content)")
            }
            ).frame(width: SizesComponents.widthFirst)
                .cornerRadius(10)
            Text("Editado em: \(postModel.updated_at)").font(.callout).frame(
                width: SizesComponents.widthSecond,
                alignment: .leading
            )
            
        }
    }
    
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
