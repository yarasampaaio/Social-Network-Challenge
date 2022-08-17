//
//  PostService.swift
//  Social-Network-Challenge
//
//  Created by Yara Vitoria on 11/08/22.
//

import Foundation

class PostsService{
    func getAllPosts() async throws -> [PostModel]{
        do {
            let (postRequest, _) = try await URLSession.shared.data(from: URL(string: "http://adaspace.local/posts")!)
            let jsonResult = try JSONDecoder().decode([PostModel].self, from: postRequest)
            return jsonResult
            
        } catch {
            print(error)
        }
        return []
    }
    init(){}
}
