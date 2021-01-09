//
//  PhotoDetailView.swift
//  U-Kraken
//
//  Created by Stevhen on 09/01/21.
//

import SwiftUI

struct PhotoDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let photo: PhotoViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(
                    url: photo.photoUrl,
                    placeholder: { ShimmerView() },
                    image: { Image(uiImage: $0).resizable() }
                )
                .aspectRatio(contentMode: .fit)
                
                VStack(alignment: .leading, spacing: 20) {
                    
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text(photo.desc.isEmpty ? (photo.altDesc.isEmpty ? "Untitled Photo" : photo.altDesc.lowercased().capitalized) : photo.desc.lowercased().capitalized)
                                .font(.system(size: 20))
                                .bold()
                                .lineLimit(nil)
                            
                            Spacer()
                        }
                        
                        Text(Utils.dateFormatterDateOrigin(photo.createdAt))
                    }
                }
                .padding()
                
                Spacer()
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(
                leading: leadingItem
            )
        }
    }
    
    var leadingItem: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            HStack {
                Image(systemName: "chevron.left")
                Text("Back")
            }
        })
    }
}
