//
//  DecoratedField.swift
//  TMDB
//
//  Created by AVINASH on 25/05/26.
//

import SwiftUI

struct DecoratedField: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 16)
            .padding(.horizontal)
            .background(
                RoundedRectangle(cornerRadius: 6, style: .continuous)
                    .foregroundStyle(Color(.textFieldGray))
            )
    }
}

extension View {
    func decoratedField() -> some View {
        modifier(DecoratedField())
    }
}
