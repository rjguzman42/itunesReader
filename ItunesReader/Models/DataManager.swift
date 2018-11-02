//
//  DataManager.swift
//  ItunesReader
//
//  Created by Roberto Guzman on 11/1/18.
//  Copyright © 2018 Fortytwo Sports. All rights reserved.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    public var allMedia: [MediaType : [Media]] = [:]
    private let libraryAPI = LibraryAPI.shared
    
    private init() {
    }
    
    func getMedia(country: Country, mediaType: MediaType, feedType: FeedType, genre: String, limit: String, completion: @escaping (Bool) -> Void) {
        libraryAPI.getMedia(country: country.rawValue, mediaType: mediaType.rawValue, feedType: feedType.rawValue, genre: genre, limit: limit) { [weak self] (result) in
            guard self != nil else {
                return
            }
            switch result {
            case .success(let itunesData):
                if let feed = itunesData.feed, let media = feed.results {
                    self?.allMedia[mediaType] = media
                    completion(true)
                }
            default:
                completion(false)
                break
            }
        }
    }
}
