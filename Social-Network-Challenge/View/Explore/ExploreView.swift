//
//  ExploreView.swift
//  Social-Network-Challenge
//
//  Created by Robson Lima Lopes on 12/08/22.
//

import SwiftUI

struct ExploreView: View {
    
    @ObservedObject private var viewModel = ViewModel()
    
    @State var isLiked: Bool = false
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                PostsComponents.addPost()
                
                ScrollView(.vertical) {
                    ForEach(viewModel.posts, id: \.id) { post in
                        buildPost(post)
                    }
                }
                
                
            }.navigationTitle("Explorar")
                .task {
                    await viewModel.getPosts()
                }
        }
        
    }
    
    func buildPost(_ postModel: PostModel)-> some View{
        
        let initialURL: String = "http://adaspace.local/"
        let media: String = postModel.media ?? ""
        let url = initialURL + media
        
        return VStack{
            GroupBox(label: Text(""),
                     content: {
                
                if !media.isEmpty{
                    AsyncImage(url: URL(string: url))
                        .frame(
                            width: SizesComponents.widthSecond
                        )
                }
                
                
                Text("\n \(postModel.content)")
            }
            ).frame(width: SizesComponents.widthFirst)
                .cornerRadius(10)
            
            HStack {
                Button(action:{
                    isLiked.toggle()
                }
                       
                ){
                    Image(systemName: "heart.fill")
                        .font(.system(size: 20))
                }.foregroundColor(isLiked ? .red : .secondary)
                
                Text("Editado em: \(postModel.updated_at)").font(.callout).frame(
                    width: SizesComponents.widthSecond,
                    alignment: .leading
                )
            }
            
        }
    }
}



struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
