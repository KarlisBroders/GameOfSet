//
//  Set.swift
//  Set
//
//  Created by Kārlis Broders on 30/01/2019.
//  Copyright © 2019 Kārlis Broders. All rights reserved.
//

import Foundation

class Set {
    
    var deck = DeckOfCards()
    
    var selectedCards = [Card]()
    
    var cardsOnTable = [Card]()
    
    var matchedCards = [Card]()

    var points = 0
    
    func newGame () {
        points = 0
        selectedCards.removeAll()
        cardsOnTable.removeAll()
        matchedCards.removeAll()
        deck.fillFullDeck()
        dealCards()
        print(deck.cards.count)
    }
    
    func dealCards() {
        var cardCount = 24
        if deck.cards.count < 24, !deck.cards.isEmpty {cardCount = deck.cards.count}
        for _ in 1...cardCount {
            if let card = deck.draw() {
                cardsOnTable.append(card)
            }
        }
        //print(cardsOnTable)
        //print(cardsOnTable.count)
        
    }
    
    func dealThreeMore() {
        if cardsOnTable.count < 22, !deck.cards.isEmpty {
            for _ in 1...3 {
                if let card = deck.draw() {
                    cardsOnTable.append(card)
                }
            }
        }
    }
    
    
    func selectCard(card: Card) {
        if selectedCards.contains(card) {
            selectedCards.remove(at: selectedCards.index(of: card)!)
            //TODO: punish player for deselecting
//            print("I punish you")
        } else {
            switch selectedCards.count {
            case 0, 1:
                selectedCards.append(card)
                print("Only one or two cards selected. Need three for a set!")
            case 2:
                selectedCards.append(card)
                if isSet(cardOne: selectedCards[0], cardTwo: selectedCards[1], cardThree: selectedCards[2]) {
                    
                    matchedCards.append(contentsOf: selectedCards)
                    
                    points = points + (27-cardsOnTable.count)/3
                    
                    for index in 0...2 {
                        if let indexOfSelectedCard = cardsOnTable.index(of: selectedCards[index]) {
                            cardsOnTable.remove(at: indexOfSelectedCard)
                        }
                    }
                    
                    
                    
                    selectedCards.removeAll()
                    print("Yeah! Found a set!")
                    
                    
                } else {
                    selectedCards.removeAll()
                }
            default:
                print("Something went terribly wrong with the Card count on Set.selectedCards")
            }
        }
        
    }
    
    
    func isSet(cardOne: Card, cardTwo: Card, cardThree: Card) -> Bool {
        for index in 0...3 {
            let sum = cardOne.rawFeatureVariants[index] + cardTwo.rawFeatureVariants[index] + cardThree.rawFeatureVariants[index]
            let setSums = [3, 6, 9]
            if !setSums.contains(sum) {
                return false
            }
        }
        return true
    }
    
    
    
}
