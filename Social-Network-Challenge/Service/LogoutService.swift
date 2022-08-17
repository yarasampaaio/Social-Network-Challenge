//
//  LogoutService.swift
//  Social-Network-Challenge
//
//  Created by Yara Vitoria on 17/08/22.
//

import Foundation

class LogoutService {
    func logout(token: String) async -> Session? {
            
            print(token)
            var request = URLRequest (url: URL(string: "http://adaspace.local/users/logout")!)
            request.httpMethod = "POST"
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            do {
                let (data, response) = try await URLSession.shared.data(for: request)
                print((response as! HTTPURLResponse).statusCode)
                print(data)
                let session = try JSONDecoder().decode(Session.self, from: data)
                return session
                
            }
            catch {
                print(error)
                
            }
            return nil
        }
}
