//
//  PhotoListView.swift
//  U-Kraken
//
//  Created by Stevhen on 08/01/21.
//

import SwiftUI

struct PhotoListView: View {
    
    @EnvironmentObject var photoListVM: PhotoListViewModel
    @Binding var query: String
    @Binding var page: Int
    
    let columns = [
        GridItem(.adaptive(minimum: 200)),
        GridItem(.adaptive(minimum: 200))
    ]
    
    var body: some View {
        
        if photoListVM.photos.isEmpty {
            Text("There are no photos yet")
                .padding()
        } else {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 10) {
                    ForEach(photoListVM.photos, id: \.id) { photo in
                        
                        NavigationLink(
                            destination: PhotoDetailView(photo: photo),
                            label: {
                                PhotoView(photoUrl: photo.photoUrl)
                            }
                        )
                    }
                }
                .padding()
                
                PullRefreshView(coordinateSpaceName: "pullToRefresh") {
                    self.getNextPagePhotos()
                }
                .padding(.bottom)
            }
            .coordinateSpace(name: "pullToRefresh")
        }
        
    }
}

//MARK: - Actions
extension PhotoListView {
    func getNextPagePhotos() {
        page += 1
        self.photoListVM.getPhotoData(query: query, page: page)
    }
}
