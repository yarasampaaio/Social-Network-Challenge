//
//  CreatUserService.swift
//  Social-Network-Challenge
//
//  Created by Yara Vitoria on 17/08/22.
//

import Foundation
class CreatUserService {
    
    func createUser(name: String, email: String, password: String) async -> Session? {
        var request = URLRequest(url: URL(string: "http://adaspace.local/users")!)
// post para eu adicionar algo no servidor
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ["Content-Type": "application/json"]
        
        let createUser = CreatUserModel(name: name, email: email, password: password)
    
        do {
            // transformando o dado swift p json
            let jsonData = try JSONEncoder().encode(createUser)
            // esses dados que serao enviados pra requisicao
            request.httpBody = jsonData
            let (data, _) = try await URLSession.shared.data(for: request)
            // trasnformando o dado json em swift
            let userData = try JSONDecoder().decode(Session.self, from: data)
            return userData
        }catch {
            print(error)
        }
        return nil
        
    }
}
