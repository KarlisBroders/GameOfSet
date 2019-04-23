//
//  DeckOfCards.swift
//  Set
//
//  Created by Kārlis Broders on 30/01/2019.
//  Copyright © 2019 Kārlis Broders. All rights reserved.
//

import Foundation

struct DeckOfCards {
    
    private(set) var cards = [Card]()
    
    
    init() {
        fillFullDeck()
    }
    
    mutating func fillFullDeck() {
        cards.removeAll()
        for symbol in Card.featureVariant.all {
            for number in Card.featureVariant.all {
                for color in Card.featureVariant.all {
                    for shading in Card.featureVariant.all {
                        cards.append(Card(symbol: symbol, number: number, color: color, shading: shading))
                    }
                }
            }
        }
    }
    
    mutating func draw() -> Card? {
        if !cards.isEmpty {
            return cards.remove(at: cards.count.arc4random)
        } else {
            return nil
        }
    }
    
    mutating func draw(at index: Int) -> Card? {
        if !cards.isEmpty {
            return cards.remove(at: index)
        } else {
            return nil
        }
    }
    

    
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}
