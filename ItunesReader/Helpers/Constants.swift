//
//  Constants.swift
//  ItunesReader
//
//  Created by Roberto Guzman on 11/1/18.
//  Copyright © 2018 Fortytwo Sports. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    
    //MARK: Strings
    
    struct Strings {
        static let musicTitle: String = "Music"
        static let moviesTitle: String = "Movies"
    }
    
    
    //MARK: Cells
    
    struct Cells {
        static let defaultTableCellId: String = "defaultTableCellId"
        static let squareMediaTableCellId: String = "squareMediaTableCellId"
        static let verticalMediaTableCellId: String = "verticalMediaTableCellId"
    }
    
    struct APIKeys {
        static let itunesRestAPIKey: String = ""
    }
    
    struct APIValues {
        static let itunesRestAPIKey: String = ""
    }

    struct APIMessage {
        static let generalError = "general error with server communication"
        static let persistencyError = "general error with local communication"
    }
}
