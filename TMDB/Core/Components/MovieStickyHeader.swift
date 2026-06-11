//
//  MovieStickyHeader.swift
//  TMDB
//
//  Created by AVINASH on 02/06/26.
//

import SwiftUI

struct MovieStickyHeader: View {
    
    let imageURL: URL?
    let height: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            let offset = geometry.frame(in: .global).minY
            
            AsyncImage(url: imageURL) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                Color.gray.overlay {
                    ProgressView()
                }
            }
            .frame(
                width: geometry.size.width,
                height: offset > 0 ? height + offset : height
            )
            .clipped()
            .offset(y: offset > 0 ? -offset : 0)
        }
        .frame(height: height)
    }
}

#Preview {
    MovieStickyHeader(
        imageURL: URL(string: "https://example.com/image.jpg"),
        height: 100
    )
}
