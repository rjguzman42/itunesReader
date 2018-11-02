//
//  ItunesAPIRouter.swift
//  ItunesReader
//
//  Created by Roberto Guzman on 11/1/18.
//  Copyright © 2018 Fortytwo Sports. All rights reserved.
//
 
import Foundation
import UIKit

enum ItunesAPIRouter: APIRouter {
    static let baseURLPath: String = "https://rss.itunes.apple.com/api/v1"
    
    case getMedia(String, String, String, String, String)
    
    func asURLRequest() -> NSMutableURLRequest {
        let result: (path: String, method: HTTPMethod, parameters: [String : AnyObject]) = {
            switch self {
            case .getMedia(let country, let mediaType, let feedType, let genre, let limit):
                return ("/\(country)/\(mediaType)/\(feedType)/\(genre)/\(limit)/explicit.json", HTTPMethod.get, [String : AnyObject]())
            }
        }()
        
        func escapedParameters(_ parameters: [String: AnyObject]) -> String {
            if parameters.isEmpty {
                return ""
            } else {
                var keyValuePairs = [String]()
                
                for (key, value) in parameters {
                    let stringValue = "\(value)"
                    
                    let escapedValue = stringValue.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
                    
                    keyValuePairs.append(key + "=" + "\(escapedValue!)")
                }
                return "?\(keyValuePairs.joined(separator: "&"))"
            }
        }
        
        //combine parameters
        var methodParameters: [String: AnyObject] = [:]
        
        for (key,value) in result.parameters {
            methodParameters[key] = value
        }
        
        //Base URLComponent
        let componentURL = URLComponents(string: "\(ItunesAPIRouter.baseURLPath)\(result.path)\(escapedParameters(methodParameters as [String:AnyObject]))")!
        
        //URL Request
        let requestURL = NSMutableURLRequest(url: componentURL.url!, cachePolicy: .useProtocolCachePolicy, timeoutInterval: TimeInterval(10 * 1000))
        
        return requestURL
    }
}
