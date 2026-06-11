//
//  ProgressLoader.swift
//  TMDB
//
//  Created by AVINASH on 25/05/26.
//

import SwiftUI

struct ProgressLoader: View {
    var body: some View {
        HStack(spacing: 8) {
            ProgressView().progressViewStyle(.circular)
            Text("Loading")
        }
    }
}

#Preview {
    ProgressLoader()
}
