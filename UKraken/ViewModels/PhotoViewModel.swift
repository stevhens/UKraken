//
//  PhotoViewModel.swift
//  U-Kraken
//
//  Created by Stevhen on 08/01/21.
//

import Foundation

class PhotoViewModel {
    var photo: Photo
    
    init(photo: Photo) {
        self.photo = photo
    }
    
    let id: UUID = UUID()
    
    var photoID: String {
        return self.photo.id
    }
    
    var createdAt: String {
        return self.photo.created_at
    }
    
    var blurHash: String {
        return self.photo.created_at
    }
    
    var desc: String {
        return self.photo.description ?? ""
    }
    
    var altDesc: String {
        return self.photo.alt_description ?? ""
    }
    
    var photoUrl: URL {
        return URL(string: self.photo.urls.small) ?? URL(string: "https://www.tibs.org.tw/images/default.jpg")!
    }
}
