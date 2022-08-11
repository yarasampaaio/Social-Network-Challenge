//
//  UserService.swift
//  Social-Network-Challenge
//
//  Created by Yara Vitoria on 11/08/22.
//

import Foundation

class UserService {
    func getAllUsers() async throws -> [UserModel]{
        do {
            let (userRequest, _) = try await URLSession.shared.data(from: URL(string: "http://adaspace.local/users")!)
            let jsonResult = try JSONDecoder().decode([UserModel].self, from: userRequest)
            return jsonResult
        } catch {
            throw error
        }
    }
}
