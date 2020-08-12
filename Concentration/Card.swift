//
//  Card.swift
//  Concentration
//
//  Created by Alexander on 29.04.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import Foundation

struct Cards: Hashable
{
    func hash(into hasher: inout Hasher) { hasher.combine(identifier)}
    static func ==(lhs: Cards, rhs: Cards ) -> Bool
    {
        lhs.identifier == rhs.identifier
    }
    var isFaceup = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    private static func getUniqindentifier() -> Int
    {
        identifierFactory += 1
        return identifierFactory
    }
    
    init()
    {
        self.identifier = Cards.getUniqindentifier()
    }
    
}



     




