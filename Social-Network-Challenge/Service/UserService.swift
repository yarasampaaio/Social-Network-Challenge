//
//  UserService.swift
//  Social-Network-Challenge
//
//  Created by Yara Vitoria on 11/08/22.
//

import Foundation

// essa funcao pega os dados de usuario da API
class UserService {
    func getAllUsers() async throws -> [UserModel] {
        do {
// nessa let eu vou guardar esses dados que foram pegos da API
            let (userRequest, _) = try await URLSession.shared.data(from: URL(string: "http://adaspace.local/users")!)
// transformando os dados da API no modelo JSON pelo decode, obedecendo o padrao UserModel, a partir da let anterior
            let jsonResult = try JSONDecoder().decode([UserModel].self, from: userRequest)
            return jsonResult
        } catch {
            print(error)
        }
        return [] 
    }
    init(){}
}
