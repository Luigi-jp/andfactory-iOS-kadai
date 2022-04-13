//
//  User.swift
//  andfactory-iOS-kadai
//
//  Created by 佐藤瑠偉史 on 2022/04/13.
//

import Foundation

struct SearchUserResponse: Codable {
    let items: [User]
}

struct User: Codable {
    let login: String
    let avatarUrlStr: String
    let type: String

    enum CodingKeys: String, CodingKey {
        case login
        case avatarUrlStr = "avatar_url"
        case type
    }
}
