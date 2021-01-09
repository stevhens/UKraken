//
//  Webservice.swift
//  U-Kraken
//
//  Created by Stevhen on 08/01/21.
//

import Foundation

class Webservice {
    
    func loadPhotos(query: String, page: Int, completion: @escaping (PhotosResponse?) -> Void) {
        
        let baseSearchURL = "https://api.unsplash.com/search/photos"
        let queryStr = "?query=" + (query.isEmpty ? "portrait" : query)
        let pageStr = "&page=\(page)"
        let apiKey = "&client_id=\(K.ApiKey)"
        
        guard let url = URL(string: baseSearchURL + queryStr + pageStr + apiKey) else {
            fatalError("Invalid URL")
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data = data, error == nil else {
                return completion(nil)
            }
            
            let photosList = try? JSONDecoder().decode(PhotosResponse.self, from: data)
            completion(photosList)
            
        }.resume()
        
    }
}

