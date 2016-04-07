//
//  ViewController.swift
//  Rock Paper Scissors
//
//  Created by Patrick Montalto on 3/27/16.
//  Copyright © 2016 swift. All rights reserved.
//

import UIKit

class OptionSelectViewController: UIViewController {

    var outcomeHistory = [Outcome]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func selectRock(sender: UIButton) {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("resultsViewController") as!  ResultsViewConroller
        let playerChoice = Option(rawValue: sender.titleForState(.Normal)!)!
        let computerChoice = Option.generateSelection()
        setOutcomeForController(controller, playerChoice: playerChoice, computerChoice: computerChoice)
        
        self.presentViewController(controller, animated: true, completion: nil)
        
    }
    
    @IBAction func selectPaper(sender: UIButton) {
        performSegueWithIdentifier("selectPaper", sender: sender)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "getHistory" {
            let controller = segue.destinationViewController as! HistoryViewController
            controller.history = outcomeHistory
        } else {
            let controller = segue.destinationViewController as! ResultsViewConroller
            let playerChoice = getPlayerOption(sender as! UIButton)
            let computerChoice = Option.generateSelection()
            setOutcomeForController(controller, playerChoice: playerChoice, computerChoice: computerChoice)
        }
    }
    
    func setOutcomeForController(controller: ResultsViewConroller, playerChoice: Option, computerChoice: Option) {
        let outcome = Outcome(player: playerChoice, computer: computerChoice)
        controller.outcome = outcome
        outcomeHistory.append(outcome)
    }
    
    func getPlayerOption(sender: UIButton) -> Option {
        let option = sender.titleForState(.Normal)
        return Option(rawValue: option!)!
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
    

}