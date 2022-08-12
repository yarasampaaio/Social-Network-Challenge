//
//  UserModel.swift
//  Social-Network-Challenge
//
//  Created by Yara Vitoria on 11/08/22.
//

import Foundation

struct UserModel: Codable {
    var id: String
    var name: String
    var email: String
}

var myFriends: [UserModel] = [
    UserModel(
        id: "1",
        name: "Amanda",
        email: "example@corporation.com"
    ),
    UserModel(
        id: "2",
        name: "Ana",
        email: "example@corporation.com"
    ),
    UserModel(
        id: "3",
        name: "Chica",
        email: "example@corporation.com"
    ),
    UserModel(
        id: "4",
        name: "Maria",
        email: "example@corporation.com"
    ),
    UserModel(
        id: "5",
        name: "Luana",
        email: "example@corporation.com"
    )
    
]
