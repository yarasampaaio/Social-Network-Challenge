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
    
    func getUsers() async {
        do {
            let usersJSON = try await UserService().getAllUsers()
            publishUser(users: usersJSON)
            
        } catch {
            print(error)
        }
    }
    
    func getPosts() async {
        do {
            let postsJSON = try await PostsService().getAllPosts()
            publishPost(posts: postsJSON)
            
            
            } catch {
                print(error)
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
