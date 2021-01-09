//
//  RefreshableScrollView.swift
//  U-Kraken
//
//  Created by Stevhen on 09/01/21.
//

import SwiftUI

struct PullRefreshView: View {
    
    var coordinateSpaceName: String
    var onRefresh: ()->Void
    
    @State var needRefresh: Bool = false
    
    var body: some View {
        
        GeometryReader { geo in
            if (geo.frame(in: .named(coordinateSpaceName)).midY > 1130) {
                Spacer()
                    .onAppear {
                        needRefresh = true
                    }
            } else if (geo.frame(in: .named(coordinateSpaceName)).maxY < 1090) {
                Spacer()
                    .onAppear {
                        if needRefresh {
                            needRefresh = false
                            onRefresh()
                        }
                    }
            }
            
            HStack {
                Spacer()
                if needRefresh {
                    ProgressView()
                }
                
                Spacer()
            }
            
        }.padding(.bottom, 50)
        
    }
}
