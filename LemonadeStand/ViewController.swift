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
    
    var customers:[Customer] = []
    var usersMoney = 10
    var lemonsInInventory = 1
    var iceCubesInInventory = 1
    var lemonsToBuy = 0
    var iceCubesToBuy = 0
    var lemonsInBrew = 0
    var iceCubesInBrew = 0
    
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
        self.brewMixture(sender)
    }
    
    @IBAction func removeLemonsFromBrewButtonPressed(sender: UIButton) {
        self.brewMixture(sender)
    }
    
    @IBAction func addIceCubesToBrewButtonPressed(sender: UIButton) {
        self.brewMixture(sender)
    }
    
    @IBAction func removeIceCubesFromBrewButtonPressed(sender: UIButton) {
        self.brewMixture(sender)
    }
    
    @IBAction func startTheDayButtonPressed(sender: UIButton) {
        self.newDayStarted()
    }
    
    //MARK: - Helper Methods
    
    func inventoryUpdate (buttonPressed: UIButton) {
        
        switch buttonPressed.tag {
        case 1:
            //Add a lemon to inventory
            
            if self.usersMoney < 2 {
                self.showAlertWithText(message: "Not enough money to purchase lemons!")
            }
            else {
                self.usersMoney -= kCostPerLemon
                self.lemonsInInventory += 1
                self.lemonsToBuy += 1
            }
            
        case 2:
            //Remove a lemon from inventory
            
            if self.lemonsInInventory <= 1 {
                self.showAlertWithText(message: "Must have atleast 1 lemon in inventory")
            }
            else {
                self.usersMoney += kCostPerLemon
                self.lemonsInInventory -= 1
                self.lemonsToBuy -= 1
            }
            
        case 3:
            //Add an ice cube to inventory
            
            if self.usersMoney < 1 {
                self.showAlertWithText(message: "Not enough money to purchase ice cubes!")
            }
            else {
                self.usersMoney -= kCostPerIceCube
                self.iceCubesInInventory += 1
                self.iceCubesToBuy += 1
            }
            
        case 4:
            //Remove an ice cube from inventory
            
            if self.iceCubesInInventory < 1 {
                self.showAlertWithText(message: "No more ice cubes in inventory")
            }
            else {
                self.usersMoney += kCostPerIceCube
                self.iceCubesInInventory -= 1
                self.iceCubesToBuy -= 1
            }
            
        default:
            println("Error")
        }
        
        self.updateMainScree()
        
    }
    
    func brewMixture (buttonPressed: UIButton) {
        switch buttonPressed.tag {
        case 1:
            //Add a lemon to brew
            
            if self.lemonsInInventory < 1 {
                self.showAlertWithText(message: "Not enough lemons in inventory!")
            }
            else {
                self.lemonsInInventory -= 1
                self.lemonsInBrew += 1
            }
            
        case 2:
            //Remove a lemon from brew
            
            if self.lemonsInBrew <= 1 {
                self.showAlertWithText(message: "Must have atleast 1 lemon in brew")
            }
            else {
                self.lemonsInInventory += 1
                self.lemonsInBrew -= 1
            }
            
        case 3:
            //Add an ice cube to brew
            
            if self.iceCubesInInventory < 1 {
                self.showAlertWithText(message: "Not enough ice cubes in inventory!")
            }
            else {
                self.iceCubesInInventory -= 1
                self.iceCubesInBrew += 1
            }
            
        case 4:
            //Remove an ice cube from brew
            
            if self.iceCubesInBrew < 1 {
                self.showAlertWithText(message: "No more ice cubes to remove")
            }
            else {
                self.iceCubesInInventory += 1
                self.iceCubesInBrew -= 1
            }
            
        default:
            println("Error")
        }
        
        self.updateMainScree()
        
    }
    
    func newDayStarted() {
        if self.lemonsInBrew == 0 {
            self.showAlertWithText(message: "Must have atleast 1 lemon in brew!")
        }
        else {
            println("\(self.calculateAcidity())")
            self.customers = Factory.createCustomersWithWeatherFactor(-3)
            
            var index = 1
            for customer in customers {
                println("custumer \(index) taste:\(customer.tastePreference)")
                index++
            }
        }
    }
    
    func calculateAcidity() -> Int {
        var acidity = 0
        var lemonadeRatio = 1.0
        var ratioString = ""
        
        if iceCubesInBrew != 0 {
            lemonadeRatio = Double(self.lemonsInBrew) / Double(self.iceCubesInBrew)
        }
        else {
            lemonadeRatio = Double(self.lemonsInBrew)
        }
        
        if lemonadeRatio == 1 && self.iceCubesInBrew != 0 {
            //Acidic
            acidity = 2
            ratioString = "Equal"
        }
        else if lemonadeRatio >= 1 {
            //Equal
            acidity = 1
            ratioString = "Acidic"
        }
        else {
            //Diluted
            acidity = 3
            ratioString = "Diluted"
        }
        
        println("Lemonade Ratio: \(lemonadeRatio)")
        println("\(ratioString)")
        return acidity
    }
    
    func updateMainScree() {
        self.moneyYouHaveLabel.text = "$\(self.usersMoney)"
        self.lemonsInInventoryLabel.text = "\(self.lemonsInInventory)"
        self.iceCubesInInventoryLabel.text = "\(self.iceCubesInInventory)"
        self.lemonsToPurchaseLabel.text = "\(self.lemonsToBuy)"
        self.iceCubesToPurchaseLabel.text = "\(self.iceCubesToBuy)"
        self.lemonsInBrewLabel.text = "\(self.lemonsInBrew)"
        self.iceCubesInBrewLabel.text = "\(self.iceCubesInBrew)"
        
    }
    
    func showAlertWithText (header: String = "Warning", message: String) {
        var alert = UIAlertController(title: header, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

