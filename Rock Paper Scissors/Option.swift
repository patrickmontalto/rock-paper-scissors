//
//  Option.swift
//  Rock Paper Scissors
//
//  Created by Patrick Montalto on 4/6/16.
//  Copyright © 2016 swift. All rights reserved.
//

import Foundation

enum Option: String {
    case Rock = "Rock"
    case Paper = "Paper"
    case Scissors = "Scissors"
    
    static func generateSelection() -> Option {
        switch arc4random() % 3 {
        case 0:
            return .Rock
        case 1:
            return .Paper
        default:
            return .Scissors
        }
    }
    
    func didDefeat(computer: Option) -> Bool {
        switch (self, computer) {
        case (.Paper, .Rock), (.Scissors, .Paper), (.Rock, .Scissors):
            return true
        default:
            return false
        }
    }
}