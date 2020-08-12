//
//  Concentration.swift
//  Concentration
//
//  Created by Alexander on 28.04.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import Foundation

class Concentration
{
    private(set) var cards = [Cards]()
    
    private var indexOfoneAndonlyOnefaceUpcard: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceup {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                            return nil
                        }
                }
            }
            return foundIndex
        }
        
        set {
            for index in cards.indices {
                cards[index].isFaceup = (index == newValue)
            }
        }
        
        
    }
    
    func chooseCards (at index: Int)
    {
        assert(cards.indices.contains(index), "Chosen index is not in range of count cards")
        if !cards[index].isMatched
        {
            if let matchIndex = indexOfoneAndonlyOnefaceUpcard, matchIndex != index
            {
                if cards[matchIndex] == cards[index]
                {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                
                cards[index].isFaceup = true
        
            } else {
                //either no cards or 2 card are faceup
                indexOfoneAndonlyOnefaceUpcard = index
            }
        }
    }

    

    
    init(numberPairsofCards: Int)
    {
        assert(numberPairsofCards > 0, "You have to have at least one paois of cards")
        for _ in 1...numberPairsofCards
        {
            let card = Cards()
            cards += [card, card]
        }
        
       cards.shuffle()
        //Method fur shuffle cards
    }
}



