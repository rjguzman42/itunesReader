//
//  LibraryAPI.swift
//  ItunesReader
//
//  Created by Roberto Guzman on 11/1/18.
//  Copyright © 2018 Fortytwo Sports. All rights reserved.
//

import Foundation

class LibraryAPI {
    static let shared = LibraryAPI()
    private let httpManager = HTTPManager()
    
    private init() {
    }
    
    
    func getMedia(country: String, mediaType: String, feedType: String, genre: String, limit: String, completion: @escaping (APIResult<ItunesGeneralData>) -> Void) {
        httpManager.getRequest(APIClientType.iTunesReader, ItunesAPIRouter.getMedia(country, mediaType, feedType, genre, limit), completion: completion)
    }
    
}
