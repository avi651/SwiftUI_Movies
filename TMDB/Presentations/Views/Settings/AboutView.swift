//
//  AboutView.swift
//  TMDB
//
//  Created by AVINASH on 09/06/26.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack(spacing: 30) {
            Image(.tmdbLogo)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 100)
            
            Text("Unofficial TMDB App")
                .font(.title)
                .fontWeight(.bold)
            
            HStack(spacing: 0) {
                Text("This product uses the ")
                Link("TMDB API", destination: URL(string: "https://developer.themoviedb.org")!)
            }
        }
    }
}

#Preview {
    AboutView()
}
