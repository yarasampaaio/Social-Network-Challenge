//
//  ViewModel.swift
//  Social-Network-Challenge
//
//  Created by Yara Vitoria on 11/08/22.
//

import SwiftUI

// o protocolo ObservableObject é usado com algum tipo de classe que pode armazenar dados que serao observaveis na interface
// Pemite o valor alterado antes que qualquer uma de suas propriedades @Published seja alterada.
class ViewModel: ObservableObject { //ObservableObject

// usar a propriedade @published para que quando os dados forem alterados, a mudanca seja anunciada e os itens atualizados
// variveis que respodem ao formato da struct que é o mesmo a ser pegue no JSON
    @Published var users = [UserModel]() // @Published
    @Published var posts = [PostModel]()
    
// funcao para pegar os usuarios pego do JSON que ja foi decodado para swift e vai pra tela
    func getUsers() async {
        do {
            let usersJSON = try await UserService().getAllUsers()
        // aqui os users do JSON, decadados, viram os users que na funcao published serao publicados
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
        //execute tarefas de forma assíncrona e simultanea
        DispatchQueue.main.async{
        // o self esta guardando os argumentos do users
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
