//
//  UserInfo.swift
//  papcorn101
//
//  Created by Ismail Tever on 21.08.2023.
//

import Foundation

// MARK: - UserInfo
struct UserInfo: Codable {
    let id: Int?
    let userFullName: String?
    let userImageUrl: String?
    let createdAt: String?
    let likeCount: Int?
    let commentCount: Int?
    let postImage: String?
    let postMessage: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case userFullName = "userFullName"
        case userImageUrl = "userImageUrl"
        case createdAt = "createdAt"
        case likeCount = "likeCount"
        case commentCount = "commentCount"
        case postImage = "postImage"
        case postMessage = "postMessage"

    }
}
