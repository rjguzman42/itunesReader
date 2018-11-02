//
//  Media.swift
//  ItunesReader
//
//  Created by Roberto Guzman on 11/1/18.
//  Copyright © 2018 Fortytwo Sports. All rights reserved.
//

import Foundation

struct Media: Codable {
    var artistName: String?
    var id: String?
    var releaseDate: String?
    var name: String?
    var kind: MediaKind?
    var copyright: String?
    var artistId: String?
    var artistUrl: String?
    var artworkUrl100: String?
    var genres: [Genre]?
    var url: String?
}
