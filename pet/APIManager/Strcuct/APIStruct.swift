//
//  APIStruct.swift
//  pet
//
//  Created by Isa Melsov on 22/11/24.
//

import Foundation

struct News: Codable {
    let id: String
    let idNews: Int
    let title: String
    let text: String
    let imageUrl: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"          // Привязка "_id" из JSON к "id" в структуре
        case idNews = "idNews"
        case title = "title"
        case text = "text"
        case imageUrl = "imageUrl"
    }
}
