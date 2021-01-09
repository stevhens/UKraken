//
//  Photo.swift
//  U-Kraken
//
//  Created by Stevhen on 08/01/21.
//

import Foundation

struct PhotosResponse: Decodable {
    let total_pages: Int
    let results: [Photo]
}

struct Photo: Decodable {
    let id: String
    let created_at: String
    let description: String?
    let alt_description: String?
    let urls: Url
}

struct Url: Decodable {
    let small: String
}
