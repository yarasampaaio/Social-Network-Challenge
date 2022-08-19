//
//  PostModel.swift
//  Social-Network-Challenge
//
//  Created by Yara Vitoria on 11/08/22.
//

import Foundation
// esse é o modelo de post proposto na API, ou seja, todo post terao esse dados, menos a media que e optional
struct PostModel: Codable {
    var id: String
    var content: String
    var media: String?
    var like_count: Int
    var user_id: String
    var created_at: String
    var updated_at: String
}


//var myposts: [PostModel] = [
//    PostModel(
//        id: "21",
//        content: "Socorro Deus",
//        user_id: "vovo",
//        created_at: "ontem",
//        updated_at: "hj"
//    ),
//    PostModel(
//        id: "22",
//        content: "Socorro Deusa",
//        user_id: "vvovo",
//        created_at: "aaaa",
//        updated_at: "hjkncj"
//    ),
//]


