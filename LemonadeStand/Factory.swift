//
//  Factory.swift
//  LemonadeStand
//
//  Created by Fredrick Myers on 10/27/14.
//  Copyright (c) 2014 Fredrick Myers. All rights reserved.
//

import Foundation

class Factory {
    class func createCustomersWithWeatherFactor(weatherFactor: Int) -> [Customer] {
        var customers: [Customer] = []
        var randomCustomerNumber = 0
        
        randomCustomerNumber = (Int(arc4random_uniform(UInt32(9)) + 1)) + weatherFactor
        println("Random Number of customers: \(randomCustomerNumber)")
        
        if randomCustomerNumber <= 0 {
            println("Weather is too bad. No customers today!")
        }
        
        for var customerCount = 0; customerCount < randomCustomerNumber; customerCount++ {
            var customer:Customer
            let randomTasteNumber = Double(arc4random_uniform(UInt32(10))) / 10.0
            
            customer = Customer(tastePreference: randomTasteNumber)
            customers.append(customer)
            
        }
        return customers
    }
}