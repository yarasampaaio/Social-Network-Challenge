//
//  ExploreView.swift
//  Social-Network-Challenge
//
//  Created by Robson Lima Lopes on 12/08/22.
//

import SwiftUI

struct FeedView: View {
    
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
                NavigationLink{AddPostView()}label:{
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
                
                ScrollView(.vertical) {
                    ForEach(myposts, id: \.id) { post in
                        PostsComponents.buildPost(postModel: post)
                    }
                }
                
            }
            .navigationTitle("Feed")
            .task {
                await viewModel.getPosts()
            }
        }
        
        
    }
}



struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
