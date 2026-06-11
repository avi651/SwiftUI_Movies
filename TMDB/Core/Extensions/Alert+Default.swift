//
//  Alert+Default.swift
//  TMDB
//
//  Created by AVINASH on 25/05/26.
//

import SwiftUI

extension View {
    func errorAlert(isPresenting: Binding<Bool>, error: Error?, title: String? = nil, message: String? = nil, dismissButton: Alert.Button? = nil) -> some View {
        alert(isPresented: isPresenting) {
            Alert(title: Text(title ?? "Error"),
                  message: Text(message ?? (error?.localizedDescription ?? "Unknown Error")),
                  dismissButton: dismissButton)
        }
    }
}
