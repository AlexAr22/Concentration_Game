//
//  ViewController.swift
//  Concentration
//
//  Created by Alexander on 25.04.2020.
//  Copyright © 2020 Alexander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    private lazy var game = Concentration(numberPairsofCards: numberPairsofCards)
    
    var numberPairsofCards: Int {
        return (cardButtons.count + 1) / 2
    }
    
    @IBOutlet private var cardButtons: [UIButton]!
    @IBOutlet weak private var flipsCountLabel: UILabel!
    
    
    
    private(set) var flipcount = 0 {
        didSet {
            flipsCountLabel.text = "Flips: \(flipcount)"
        }
    }
        
    @IBAction private func touchCard(_ sender: UIButton) {
    flipcount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            game.chooseCards(at: cardNumber)
            updateViewfromModel()
    }
        else{
            print("Chosen card was not add to cardButtons")
        }
    }
    
    private func updateViewfromModel()
    {
        for index in cardButtons.indices
        {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceup
            {
            button.setTitle(emoji(for: card), for: UIControl.State.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
   private var emojies: [String] = ["👻", "👽", "🎃", "☠️", "👹" ,"👺", "🤡", "😻", "😼"]
   private var emojis = [Cards:String]()
   
    
    private func emoji(for card: Cards) -> String
    {
        if emojis[card] == nil && emojies.count > 0
        {
            emojis[card] = emojies.remove(at : emojies.count.arc4random)
        }
      /*  if emojis[card.identifier] != nil
        {
                return emojis[card.identifier]!
        }else{
        return "?"
        }
            
        }*/
    
        return emojis[card] ?? "?" // the same
    }
    
    
}


extension Int {
    var arc4random: Int {
        if self > 0 {
        return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}

