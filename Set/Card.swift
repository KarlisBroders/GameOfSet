//
//  Card.swift
//  Set
//
//  Created by Kārlis Broders on 30/01/2019.
//  Copyright © 2019 Kārlis Broders. All rights reserved.
//

import Foundation

struct Card: Equatable {
    
    
    
    let symbol, number, color, shading: featureVariant
    
    var rawFeatureVariants: Array<Int> {
        return [symbol.rawValue, number.rawValue, color.rawValue, shading.rawValue]
    }
    
//    func featuresToString() -> String {
//        var features = ""
//        for value in rawFeatureVariants {
//            features.append(contentsOf: String(value))
//            features.append(".")
//        }
//        return features
//    }
    
    
    enum featureVariant: Int, CustomStringConvertible {
        var description: String {
            return String(rawValue)
        }
        
        case one = 1
        case two = 2
        case three = 3
        
        static var all = [featureVariant.one, .two, .three]
    }
    

}
