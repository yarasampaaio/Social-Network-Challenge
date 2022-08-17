//
//  CreatPostService.swift
//  Social-Network-Challenge
//
//  Created by Yara Vitoria on 17/08/22.
//

import Foundation

class CreatPortService {
    func createpost(token: String, content: String) async -> PostModel? {
           
           print(token)
           var request = URLRequest (url: URL(string: "http://adaspace.local/posts")!)
           request.httpMethod = "POST"
           request.setValue("text/plain", forHTTPHeaderField: "Content-Type")
           request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
           let dados = content.data(using: .utf8)!
           request.httpBody = dados as Data
           let decoder = JSONDecoder()
           let formatter = ISO8601DateFormatter()
           
           decoder.dateDecodingStrategy = .custom({ decoder in
               let container = try decoder.singleValueContainer()
               let dateString = try container.decode(String.self)
               
               if let date = formatter.date(from: dateString){
                   return date
               }
               
               throw DecodingError.dataCorruptedError(in: container, debugDescription: "")
           })
           
           do {
               let (data, response) = try await URLSession.shared.data(for: request)
               print((response as! HTTPURLResponse).statusCode)
               print(data)
               let post = try decoder.decode(PostModel.self, from: data)
               return post
               
           }
           catch {
               print(error)
               
           }
           return nil
       }
}
