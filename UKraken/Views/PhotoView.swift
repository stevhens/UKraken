//
//  PhotoView.swift
//  U-Kraken
//
//  Created by Stevhen on 08/01/21.
//

import SwiftUI

struct PhotoView: View {
    
    let photoUrl: URL

    var body: some View {
        
        ZStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 0) {
                
                AsyncImage(
                    url: photoUrl,
                    placeholder: { ShimmerView() },
                    image: { Image(uiImage: $0).resizable() }
                )
                .aspectRatio(contentMode: .fit)
                
            }
        }
        .cornerRadius(8.0)
        .shadow(radius: 5)
        .frame(maxWidth: UIScreen.main.bounds.width * 0.4, maxHeight: 800)
        
    }
}
