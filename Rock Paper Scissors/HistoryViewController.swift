//
//  HistoryViewController.swift
//  Rock Paper Scissors
//
//  Created by Patrick Montalto on 4/6/16.
//  Copyright © 2016 swift. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource {
    
    var history = [Outcome]()
    var winCount: Int!
    var loseCount: Int!
    var tieCount: Int!
    
    @IBOutlet var winLabel: UILabel!
    @IBOutlet var loseLabel: UILabel!
    @IBOutlet var tieLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(history.count)")
        winCount = history.filter({ $0.playerWin }).count
        loseCount = history.filter({ !$0.playerWin && !$0.tie }).count
        tieCount = history.filter({ $0.tie }).count
        
        winLabel.text = "\(winCount)"
        loseLabel.text = "\(loseCount)"
        tieLabel.text = "\(tieCount)"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("OutcomeCell") as UITableViewCell!
        let outcome = history[indexPath.row]
        if outcome.playerWin {
            cell.textLabel?.text = "You won!"
            cell.imageView?.image = UIImage(named: "win")
        } else if outcome.tie {
            cell.textLabel?.text = "Tie"
            cell.imageView?.image = UIImage(named: "tie_icon")
        } else {
            cell.textLabel?.text = "You lost"
            cell.imageView?.image = UIImage(named: "lose")
        }
        cell.detailTextLabel?.text = "\(outcome.player) vs \(outcome.computer)"
        return cell
    }
    
    @IBAction func goBack(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.Portrait
    }
}