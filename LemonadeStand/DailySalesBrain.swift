//
//  DailySalesBrain.swift
//  LemonadeStand
//
//  Created by Fredrick Myers on 10/29/14.
//  Copyright (c) 2014 Fredrick Myers. All rights reserved.
//

import Foundation

class DailySalesBrain {
    class func calculateDailySales(customers: [Customer], acidity: Int) -> Int {
        var earnings = 0
        
        for customer in customers {
            println("Customer Taste: \(customer.tastePreference) Acidity: \(acidity)")
            if customer.tastePreference >= 0 && customer.tastePreference < 0.4 && acidity == 1 {
                earnings += 1
                println("Paid")
            }
            else if customer.tastePreference >= 0.4 && customer.tastePreference < 0.6 && acidity == 2 {
                earnings += 1
                println("Paid")
            }
            else if customer.tastePreference >= 0.6 && customer.tastePreference <= 1.0 && acidity == 3 {
                earnings += 1
                println("Paid")
            }
            else {
                println("Yuck!!! No purchases.")
            }
        }
        println("Earnings: \(earnings)")
        println("----------------------------------------------")
        return earnings
    }
}
