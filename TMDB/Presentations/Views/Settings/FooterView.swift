//
//  FooterView.swift
//  TMDB
//
//  Created by AVINASH on 09/06/26.
//

import SwiftUI

struct FooterView: View {
    var body: some View {
        VStack(spacing: 8) {
            Text("App Version 1.0.0")
            Text("Made by Avinash")
        }.font(.caption)
            .padding(.bottom)
    }
}

#Preview {
    FooterView()
}
