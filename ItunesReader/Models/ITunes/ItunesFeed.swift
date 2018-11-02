//
//  ItunesFeed.swift
//  ItunesReader
//
//  Created by Roberto Guzman on 11/2/18.
//  Copyright © 2018 Fortytwo Sports. All rights reserved.
//

import Foundation

struct ItunesFeed: Codable {
    var copyright: String?
    var country: Country?
    var icon: String?
    var id: String?
    var results: [Media]?
}
