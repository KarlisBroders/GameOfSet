//
//  ViewController.swift
//  Set
//
//  Created by Kārlis Broders on 30/01/2019.
//  Copyright © 2019 Kārlis Broders. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let game = Set()
    
    
    @IBOutlet weak var cardsLeftInDeckLabel: UILabel!
    @IBOutlet weak var score: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func newGame(_ sender: UIButton) {
        game.newGame()
        updateViewFromModel()
        print(game.cardsOnTable.count)
    }
    
    @IBAction func dealThreeMore(_ sender: UIButton) {
        game.dealThreeMore()
        updateViewFromModel()
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            if cardNumber < game.cardsOnTable.count {
                game.selectCard(card: game.cardsOnTable[cardNumber])
                updateViewFromModel()
                print(game.cardsOnTable.count)

            } else {
                print("empty positition")
            }
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    //"▲●■"
    func updateViewFromModel() {
        cardsLeftInDeckLabel.text = String(game.deck.cards.count)
        score.text = "Score: \(game.points)"
        
        for index in cardButtons.indices {
            let button = cardButtons[index]
            if index < game.cardsOnTable.count {
                let card = game.cardsOnTable[index]
                
                
                
                if game.selectedCards.contains(card) {
                    button.layer.borderWidth = 3.0
                    button.layer.borderColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
                } else {
                    button.layer.borderWidth = 1.0
                    button.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                }

                button.setAttributedTitle(getAttributedString(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                
            } else {
                button.setAttributedTitle(NSAttributedString(string: ""), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
                button.layer.borderColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
            }
        }
    }
    
    
    func getAttributedString(for card: Card) -> NSAttributedString {
        var symbol: String
        var color: UIColor
        var strokeWidth = -3
        
        switch card.symbol {
        case .one:
            symbol = "▲"
        case .two:
            symbol = "●"
        case .three:
            symbol = "■"
        }
        
        switch card.number {
        case .one:
            break
        case .two:
            symbol += symbol
        case .three:
            symbol += symbol + symbol
        }
        
        switch card.color {
        case .one:
            color = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        case .two:
            color = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        case .three:
            color = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        }
        
        switch card.shading {
        case .one:
            break
        case .two:
            color = color.withAlphaComponent(0.35)
        case .three:
            strokeWidth = 3
        }
        
        let attributes: [NSAttributedString.Key: Any] = [
            .font : UIFont.systemFont(ofSize: 26),
            .strokeColor : color,
            .strokeWidth : strokeWidth,
            .foregroundColor: color
        ]
        
        return NSAttributedString(string: symbol, attributes: attributes)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //var deck = DeckOfCards()
        //print(deck.cards.count)
        
//        game.dealCards()
//        print(game.cardsOnTable.count)
//
//        let cardOne = Card(symbol: Card.featureVariant.three,number: Card.featureVariant.two, color: Card.featureVariant.three, shading: Card.featureVariant.three)
//
//        game.selectCard(card: cardOne)
//        game.selectCard(card: cardOne)
//        game.selectCard(card: cardOne)
//
//        let cardTwo = Card(symbol: Card.featureVariant.two, number: Card.featureVariant.three, color: Card.featureVariant.three, shading: Card.featureVariant.three)
//
//        game.selectCard(card: cardTwo)
//
//        let cardthree = Card(symbol: Card.featureVariant.one, number: Card.featureVariant.one, color: Card.featureVariant.three, shading: Card.featureVariant.three)
//
//        game.selectCard(card: cardthree)
//         print(game.cardsOnTable.count)
//
//
//        game.dealCards()
//
//        game.dealCards()
//
//        game.dealCards()
//        game.dealCards()
//
//
//        print(game.isSet(cardOne: cardOne, cardTwo: cardTwo, cardThree: cardthree))
        
        // Do any additional setup after loading the view, typically from a nib.
    }


}

