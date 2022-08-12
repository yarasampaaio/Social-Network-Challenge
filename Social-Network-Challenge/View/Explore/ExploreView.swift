//
//  ExploreView.swift
//  Social-Network-Challenge
//
//  Created by Robson Lima Lopes on 12/08/22.
//

import SwiftUI

struct ExploreView: View {
    
    @ObservedObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
                PostsComponents.addPost()
                
                ScrollView(.vertical) {
                    ForEach(myposts, id: \.id) { post in
                        PostsComponents.buildPost(postModel: post)
                    }
                }
                
                
                
            }.navigationTitle("Explorar")
                .task {
                    await viewModel.getPosts()
            }
        }
        
        
    }
}



struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
