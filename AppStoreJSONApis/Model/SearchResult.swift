//
//  SearchResult.swift
//  AppStoreJSONApis
//
//  Created by VINH HOANG on 03/01/2022.
//

import Foundation

struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Result]
    
}

struct Result: Decodable {
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
    let artworkUrl100: String
    let screenshotUrls: [String]
}
