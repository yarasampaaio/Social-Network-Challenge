//
//  PostService.swift
//  Social-Network-Challenge
//
//  Created by Yara Vitoria on 11/08/22.
//

import Foundation

class PostsService: ObservableObject {
    @Published var posts = [PostModel]()
    
    func getAllPosts() async throws -> [PostModel]{
        
        //buscando dados da url em questao
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: "http://adaspace.local/posts")!)

            //decode that data
            if let decodeResponde = try? JSONDecoder()
                .decode([PostModel].self, from: data)
            {
                publishPost(posts: decodeResponde)
            }
        } catch {
            print("this data isn't valid")
        }
        
        return self.posts
    }
    
    func publishPost(posts:[PostModel]){
        DispatchQueue.main.async{
            self.posts = posts
            print(posts)
        }
    }
}
