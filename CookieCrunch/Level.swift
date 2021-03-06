//
//  Level.swift
//  CookieCrunch
//
//  Created by Innocenzo Tremamondo on 15/03/15.
//  Copyright (c) 2015 LabNova. All rights reserved.
//
import Foundation

let NumColumns = 9
let NumRows = 9

class Level {
    private var cookies = Array2D<Cookie>(columns: NumColumns, rows: NumRows)
     private var tiles = Array2D<Tile>(columns: NumColumns, rows: NumRows)
    
    func cookieAtColumn(column: Int, row: Int) -> Cookie? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return cookies[column, row]
    }
    
    func shuffle() -> Set<Cookie> {
     return createInitialCookies()
        
    }
        private func createInitialCookies() -> Set<Cookie> {
            var set = Set<Cookie>()
            
            //1
            for row in 0..<NumRows {
                for column in 0..<NumColumns {
                    
                    if tiles[column, row] != nil {
                        
                   
                    
                    //2
                    var cookieType = CookieType.random()
                    
                    //3
                    let cookie = Cookie(column: column, row: row, cookieType: cookieType)
                    cookies[column, row] = cookie
                    
                    //4
                    set.addElement(cookie)
                        
                    } // -> fine IF
                }
            }
            
            return set;
        }
    
    func tileAtColumn(column:Int, row:Int) -> Tile? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return tiles[column, row]
    }
    
    func performSwap(swap: Swap) {
        let columnA = swap.cookieA.column
        let rowA = swap.cookieA.row
        let columnB = swap.cookieB.column
        let rowB = swap.cookieB.row
        
        cookies[columnA, rowA] = swap.cookieB
        swap.cookieB.column = columnA
        swap.cookieB.row = rowA
        
        cookies[columnB, rowB] = swap.cookieA
        swap.cookieA.column = columnB
        swap.cookieA.row = rowB
    }
    
    init(filename:String) {
        //1
        if let dictionary = Dictionary<String, AnyObject>.loadJSONFromBundle(filename) {
            //2
            if let tilesArray: AnyObject = dictionary["tiles"] {
                //3
                for(row, rowArray) in enumerate(tilesArray as [[Int]]) {
                    //4
                    let tileRow = NumRows - row - 1
                    //5
                    for (column, value) in enumerate(rowArray) {
                        if value == 1 {
                            tiles[column, tileRow] = Tile()
                        }
                    }
                }
            }
        }
    }
    
}

