//
//  APIRouter.swift
//  ItunesReader
//
//  Created by Roberto Guzman on 11/1/18.
//  Copyright © 2018 Fortytwo Sports. All rights reserved.
//

import Foundation

protocol APIRouter {
    static var baseURLPath: String { get }
    
    func asURLRequest() -> NSMutableURLRequest
}
