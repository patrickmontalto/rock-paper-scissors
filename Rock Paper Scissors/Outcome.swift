//
//  Outcome.swift
//  Rock Paper Scissors
//
//  Created by Patrick Montalto on 4/6/16.
//  Copyright © 2016 swift. All rights reserved.
//

import Foundation

struct Outcome {
    let player: Option
    let computer: Option
    
    var winner: Option {
        get {
            return player.didDefeat(computer) ? player : computer
        }
    }
    
    var loser: Option {
        get {
            return player.didDefeat(computer) ? computer : player
        }
    }
    
    var playerWin: Bool {
        get {
            return player.didDefeat(computer)
        }
    }
    
    var tie: Bool {
        get {
            return player == computer
        }
    }
}