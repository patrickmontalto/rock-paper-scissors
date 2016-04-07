//
//  resultsViewController.swift
//  Rock Paper Scissors
//
//  Created by Patrick Montalto on 3/27/16.
//  Copyright © 2016 swift. All rights reserved.
//

import UIKit

class ResultsViewConroller: UIViewController {
    
    @IBOutlet var result: UIImageView!
    
    var outcome: Outcome!
    
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if outcome.tie  {
            result.image = UIImage(named: "tie")
            resultLabel.text = "There's been a tie!"
        } else {
            result.image = UIImage(named: (outcome.winner.rawValue + "_win").lowercaseString)
            displayResults()
        }
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    
    func displayResults() {
        if outcome.playerWin {
            resultLabel.text = "You win! \(outcome.winner) beats \(outcome.loser)"
        } else {
            resultLabel.text = "You lose... \(outcome.loser) loses to \(outcome.winner)"
        }
    }
    
    @IBAction func dismiss() {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}