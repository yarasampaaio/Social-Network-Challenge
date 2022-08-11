//
//  ViewModel.swift
//  Social-Network-Challenge
//
//  Created by Yara Vitoria on 11/08/22.
//

import SwiftUI

class ViewModel: ObservableObject { //ObservableObject
    
    @Published var users = [UserModel]() // @Published
    @Published var posts = [PostModel]()
    
    @ObservedObject private var postsService = PostsService()

    func getUsers() async {
        //criando url
        guard let url = URL(string: "http://adaspace.local/users") else
        {
            print("Nao ta funcionando")
            return
        }
        //buscando dados da url em questao
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            //decode that data
            if let decodeResponde = try?JSONDecoder()
                .decode([UserModel].self, from: data)
            {
                publishUser(users: decodeResponde)
            }
        } catch {
            print("this data isn't valid")
        }
    }
    
    func getPosts() async {
        //criando url
        guard let url = URL(string: "http://adaspace.local/posts") else
        {
            print("Nao ta funcionando")
            return
        }
        //buscando dados da url em questao
        do {
            let (data, _) = try await URLSession.shared.data(from: url)

            //decode that data
            if let decodeResponde = try? JSONDecoder()
                .decode([PostModel].self, from: data)
            {
                publishPost(posts: decodeResponde)
            }
        } catch {
            print("this data isn't valid")
        }
    }
    
    func publishUser(users:[UserModel]){
        DispatchQueue.main.async{
            self.users = users
            print(users)
        }
    }
    
    func publishPost(posts:[PostModel]){
        DispatchQueue.main.async{
            self.posts = posts
            print(posts)
        }
    }

    init(){}
    
}
