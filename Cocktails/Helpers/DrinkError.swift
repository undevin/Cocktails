//
//  DrinkError.swift
//  Cocktails
//
//  Created by Devin Flora on 1/27/21.
//

import Foundation

enum DrinkError: LocalizedError {
    case invalidURL
    case thrownError(Error)
    case noData
    case unableToDecode
    
    var errorDescription: String {
        switch self {
        case .invalidURL:
            return "Unable to reach the drinks server"
        case .thrownError(let error):
            return error.localizedDescription
        case .noData:
            return "The server didn't bring back any drinks"
        case .unableToDecode:
            return "Unable to mix the drinks"
        }
    }
}//End of Enum
