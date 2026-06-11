//
//  Setting.swift
//  TMDB
//
//  Created by AVINASH on 26/05/26.
//

import Foundation

struct Setting: Identifiable {
    let id: UUID = UUID()
    let icon: String
    let title: String
    
    static func getSettingItems() -> [Setting] {
        [
            .init(icon: "heart", title: "Favorite Movies"),
            .init(icon: "popcorn", title: "Watchlist Movies"),
            .init(icon: "sun.max", title: "Theme"),
            .init(icon: "person.badge.plus", title: "Follow on Twitter"),
            .init(icon: "person.badge.plus", title: "Follow on LinkedIn"),
            .init(icon: "questionmark.circle", title: "About"),
            .init(icon: "rectangle.portrait.and.arrow.right", title: "Logout"),
        ]
    }
}

