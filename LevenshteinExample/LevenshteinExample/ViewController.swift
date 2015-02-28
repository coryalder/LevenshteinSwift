//
//  ViewController.swift
//  LevenshteinExample
//
//  Created by Cory Alder on 2015-02-28.
//  Copyright (c) 2015 Davander Mobile Corporation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var baseField: UITextField!
    
    @IBOutlet weak var comparisonField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.recalculateScore(baseField)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recalculateScore(sender: AnyObject) {
        
        let score = (baseField.text as NSString).asciiLevenshteinDistanceWithString(comparisonField.text as NSString)
    
        scoreLabel.text = "Score: \(score)"
    }

}

