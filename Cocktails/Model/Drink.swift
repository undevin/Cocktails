//
//  Drink.swift
//  Cocktails
//
//  Created by Devin Flora on 1/27/21.
//

import Foundation

struct TopLevelObject: Decodable {
    let drinks: [Drink]
}

struct Drink: Decodable {
    let strDrink: String
    let strInstructions: String
    let strDrinkThumb: URL
}
