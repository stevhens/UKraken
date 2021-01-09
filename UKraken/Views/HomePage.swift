//
//  HomePage.swift
//  U-Kraken
//
//  Created by Stevhen on 08/01/21.
//

import SwiftUI

struct HomePage: View {
    
    @ObservedObject var photoListVM = PhotoListViewModel()
    @State var searchQuery: String = ""
    @State var page: Int = 1
    @State var isExpandSearchBar: Bool = false
    @State var isSearching: Bool = false
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                HStack {
                    if !self.isExpandSearchBar {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Unsplash Kraken")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                    }
                    
                    Spacer(minLength: 0)
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .onTapGesture {
                            withAnimation {
                                self.isExpandSearchBar = true
                            }
                        }
                    
                    if self.isExpandSearchBar {
                        
                        TextField("Search...", text: self.$searchQuery)
                        
                        if self.searchQuery != "" {
                            
                            Button(action: {
                                self.isSearching = true
                                self.photoListVM.photos.removeAll()
                                self.page = 1
                                self.SearchPhotos()
                            }) {
                                Text("Search")
                                    .fontWeight(.bold)
                                    .foregroundColor(colorScheme == .dark ? .white : .black)
                            }
                        }
                        
                        Button(action: {
                            withAnimation{
                                self.isExpandSearchBar = false
                            }
                            
                            self.searchQuery = ""
                            
                            if self.isSearching{
                                self.isSearching = false
                                self.photoListVM.photos.removeAll()
                                self.page = 1
                                self.photoListVM.getPhotoData(query: "", page: page)
                            }
                            
                        }) {
                            Image(systemName: "xmark")
                                .font(.system(size: 15, weight: .bold))
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                        }
                        .padding(.leading, 10)
                    }
                }
                .padding()
                
                if self.photoListVM.photos.isEmpty {
                    Spacer()
                    if self.photoListVM.isEmptyResults {
                        Text("No Results Found")
                    } else {
                        Indicator()
                    }
                    Spacer()
                } else {
                    VStack(spacing: 0) {
                        PhotoListView(query: $searchQuery, page: $page)
                    }
                }
            }
            
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
        .environmentObject(photoListVM)
    }
}

//MARK: - Actions
extension HomePage {
    func SearchPhotos() {
        let query = self.searchQuery.replacingOccurrences(of: " ", with: "%20")
        self.photoListVM.getPhotoData(query: query, page: page)
    }
}
