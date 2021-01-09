//
//  Indicator.swift
//  U-Kraken
//
//  Created by Stevhen on 09/01/21.
//

import SwiftUI

struct Indicator : UIViewRepresentable {
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
}
