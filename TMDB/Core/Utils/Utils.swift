//
//  Utils.swift
//  TMDB
//
//  Created by AVINASH on 25/05/26.
//

import Foundation

class Utils {
    static func getMovieDuration(runtime: Int) -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .full
        formatter.allowedUnits = [.hour, .minute]
        return formatter.string(from: TimeInterval(runtime) * 60) ?? "Not Found"
    }
}

