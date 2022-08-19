//
//  SessionModel.swift
//  Social-Network-Challenge
//
//  Created by Yara Vitoria on 17/08/22.
//

import Foundation

struct Session: Codable {
    var token: String
    var user: UserModel
    
}
