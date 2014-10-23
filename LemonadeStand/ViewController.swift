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
    
    //MARK: - Variable
    
    var usersMoney = 10
    var lemonsInInventory = 1
    var iceCubesInInventory = 1
    var lemonsToBuy = 0
    var iceCubesToBuy = 0
    
    //MARK: - Constants
    
    let kCostPerLemon = 2
    let kCostPerIceCube = 1
    
    
    //MARK: - Main Code
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.updateMainScree()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - IBActions
    
    @IBAction func addLemonsToInventoryButtonPressed(sender: UIButton) {
        self.inventoryUpdate(sender)
    }
    
    @IBAction func removeLemonsFromInventoryButtonPressed(sender: UIButton) {
        self.inventoryUpdate(sender)
    }
    
    @IBAction func addIceCubesToInventoryButtonPressed(sender: UIButton) {
        self.inventoryUpdate(sender)
    }

    @IBAction func removeIceCubesFromInventoryButtonPressed(sender: UIButton) {
        self.inventoryUpdate(sender)
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
    
    //MARK: - Helper Methods
    
    func inventoryUpdate (buttonPressed: UIButton) {
        
        switch buttonPressed.tag {
        case 1:
            //Add a lemon to inventory
            self.usersMoney -= kCostPerLemon
            self.lemonsInInventory += 1
            self.lemonsToBuy += 1
        case 2:
            //Remove a lemon from inventory
            self.usersMoney += kCostPerLemon
            self.lemonsInInventory -= 1
            self.lemonsToBuy -= 1
        case 3:
            //Add ice cube to inventory
            self.usersMoney -= kCostPerIceCube
            self.iceCubesInInventory += 1
            self.iceCubesToBuy += 1
        case 4:
            self.usersMoney += kCostPerIceCube
            self.iceCubesInInventory -= 1
            self.iceCubesToBuy -= 1
        default:
            println("Error")
        }
        
        self.updateMainScree()
        
    }
    
    func updateMainScree() {
        self.moneyYouHaveLabel.text = "$\(self.usersMoney)"
        self.lemonsInInventoryLabel.text = "\(self.lemonsInInventory)"
        self.iceCubesInInventoryLabel.text = "\(self.iceCubesInInventory)"
        self.lemonsToPurchaseLabel.text = "\(self.lemonsToBuy)"
        self.iceCubesToPurchaseLabel.text = "\(self.iceCubesToBuy)"
    }
    
    
}

