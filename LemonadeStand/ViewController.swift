//
//  ViewController.swift
//  LemonadeStand
//
//  Created by Fredrick Myers on 10/23/14.
//  Copyright (c) 2014 Fredrick Myers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - IBOutlets
    
    @IBOutlet weak var moneyYouHaveLabel: UILabel!
    @IBOutlet weak var lemonsInInventoryLabel: UILabel!
    @IBOutlet weak var iceCubesInInventoryLabel: UILabel!
    @IBOutlet weak var lemonsToPurchaseLabel: UILabel!
    @IBOutlet weak var iceCubesToPurchaseLabel: UILabel!
    @IBOutlet weak var lemonsInBrewLabel: UILabel!
    @IBOutlet weak var iceCubesInBrewLabel: UILabel!
    @IBOutlet weak var todaysForecastImageView: UIImageView!
    
    //MARK: - Main Code
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - IBActions
    
    @IBAction func addLemonsToInventoryButtonPressed(sender: UIButton) {
    }
    
    @IBAction func removeLemonsFromInventoryButtonPressed(sender: UIButton) {
    }
    
    @IBAction func addIceCubesToInventoryButtonPressed(sender: UIButton) {
    }

    @IBAction func removeIceCubesFromInventoryButtonPressed(sender: UIButton) {
    }

    @IBAction func addLemonsToBrewButtonPressed(sender: UIButton) {
    }
    
    @IBAction func removeLemonsFromBrewButtonPressed(sender: UIButton) {
    }
    
    @IBAction func addIceCubesToBrewButtonPressed(sender: UIButton) {
    }
    
    @IBAction func removeIceCubesFromBrewButtonPressed(sender: UIButton) {
    }
    
    @IBAction func startTheDayButtonPressed(sender: UIButton) {
    }
    
    
}

