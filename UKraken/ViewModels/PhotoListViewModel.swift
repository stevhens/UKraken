//
//  PhotoListViewModel.swift
//  U-Kraken
//
//  Created by Stevhen on 08/01/21.
//

import Foundation
import Combine

class PhotoListViewModel: ObservableObject {
    
    @Published var photos = [PhotoViewModel]()
    @Published var isEmptyResults = false
    
    private var pagePhotos = [PhotoViewModel]()
    private var totalPage = 1
    private var currPage = 1
    
    init() {
        getPhotoData(query: "", page: currPage)
    }
    
    func getPhotoData(query: String, page: Int) {
        Webservice().loadPhotos(query: query, page: page) { photoList in
            if let photoList = photoList {
                DispatchQueue.main.async {
                    self.isEmptyResults = photoList.results.isEmpty
                    self.totalPage = photoList.total_pages
                    self.currPage += (self.currPage < self.totalPage ? 1 : 0)
                    self.pagePhotos = photoList.results.map(PhotoViewModel.init)
                    self.photos.append(contentsOf: self.pagePhotos)
                    self.pagePhotos.removeAll()
                }
            }
        }
    }
}
