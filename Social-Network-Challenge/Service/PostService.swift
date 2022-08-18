//
//  PostService.swift
//  Social-Network-Challenge
//
//  Created by Yara Vitoria on 11/08/22.
//

import Foundation
// essa funcao pega todos os posts da API
class PostsService{
    func getAllPosts() async throws -> [PostModel]{
        do {
// eu coloco em uma variavel os dados que eu pego da API a partir da URL colocada
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
