//
//  Cookie.swift
//  CookieCrunch
//
//  Created by Innocenzo Tremamondo on 15/03/15.
//  Copyright (c) 2015 LabNova. All rights reserved.
//

import SpriteKit

enum CookieType: Int, Printable {
    case Unkown = 0, Croissant, Cupcake, Danish, Donut, Macaroon, SugarCookie
    
    var spriteName: String {
        let spriteNames = [
            "Croissant",
            "Cupcake",
            "Danish",
            "Donut",
            "Macaroon",
            "SugarCookie" ]
        
        return spriteNames[rawValue - 1]
    }
    
    var hightlightedSpriteName: String {
        return spriteName + "-Highlighted"
    }
    
    static func random() -> CookieType {
        return CookieType(rawValue: Int(arc4random_uniform(6)) + 1)!
    }
    
    var description: String {
        return spriteName
    }
    
}

class Cookie : Printable, Hashable {
    var hashValue: Int {
        return row*10 + column
    }
    
    var column: Int
    var row: Int
    let cookieType: CookieType
    var sprite: SKSpriteNode?
    
    var description:String {
        return "type: \(cookieType) square:(\(column), \(row))"
    }
    
    init(column: Int, row: Int, cookieType: CookieType) {
        self.column = column
        self.row = row
        self.cookieType = cookieType
    }
    
}

func ==(lhs: Cookie, rhs:Cookie) ->Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row
}
