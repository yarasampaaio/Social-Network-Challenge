//
//  ContentView.swift
//  Social-Network-Challenge
//
//  Created by Yara Vitoria on 10/08/22.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject private var viewModel = ViewModel() // ObservedObject
        
    var body: some View {
        
        NavigationView{
            List(viewModel.posts, id: \.id) { posts in
                VStack(alignment: .leading){
                    Image(posts.)
                    Text(posts.content)
                        .font(.headline)
                    Text(posts.created_at)
                        .font(.body)
                }
            }
            .navigationTitle("Cadastrados")
            .task {
                await viewModel.getPosts()
            }
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
