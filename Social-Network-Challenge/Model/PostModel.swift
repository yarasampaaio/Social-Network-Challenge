//
//  PostModel.swift
//  Social-Network-Challenge
//
//  Created by Yara Vitoria on 11/08/22.
//

import Foundation

struct PostModel: Codable {
    var id: String
    var content: String
    var user_id: String
    var created_at: String
    var updated_at: String
}
