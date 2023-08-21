//
//  MovieInfo.swift
//  papcorn101
//
//  Created by Ismail Tever on 21.08.2023.
//

import Foundation

// MARK: - MovieInfo
struct MovieInfo: Codable {
    let id: Int?
    let movieImage: String?
    let movieTitle: String?
    let movieYear: Int?
    let movieGenre: String?
    let isPopular: Bool?
    let isRecommended: Bool?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case movieImage = "movieImage"
        case movieTitle = "movieTitle"
        case movieYear = "movieYear"
        case movieGenre = "movieGenre"
        case isPopular = "isPopular"
        case isRecommended = "isRecommended"
    }
}
