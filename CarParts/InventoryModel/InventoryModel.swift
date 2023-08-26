//
//  InventoryModel.swift
//  CarParts
//
//  Created by Sinmisola Kareem on 8/23/23.
//

import Foundation

struct Car: Hashable {
    var make: String
    var model: String
    var year: Int
    // Add more properties as needed

    // Implement the Hashable protocol
    func hash(into hasher: inout Hasher) {
        hasher.combine(make)
        hasher.combine(model)
        hasher.combine(year)
    }
        
    static func ==(lhs: Car, rhs: Car) -> Bool {
        return lhs.make == rhs.make && lhs.model == rhs.model && lhs.year == rhs.year
    }
    
    var inventoryItems: [InventoryItem] = []
    // Function to add inventory items for a car
    func addInventory(for car: inout Car, with item: InventoryItem) {
        car.inventoryItems.append(item)
    }
    
    // Function to add make for a car
    func addMake(for car: inout Car, with make: String) {
        car.make = make
    }
    
    // Function to add year for a car
    func addYear(for car: inout Car, with year: Int) {
        car.year = year
    }
    
    // Function to add Model for a car
    func addModel(for car: inout Car, with model: String) {
        car.model = model
    }
    // Function to retrieve inventory items for a car
    func getInventory(for car: Car) -> [InventoryItem]? {
        return car.inventoryItems
    }
    
    // Function to retrieve year of a car
    func getYear(for car: Car) -> Int? {
        return car.year
    }
    
    // Function to retrieve make of a car
    func getMake(for car: Car) -> String? {
        return car.make
    }
    
    // Function to retrieve make of a car
    func getModel(for car: Car) -> String? {
        return car.model
    }
}

struct InventoryItem {
    var partName: String
    var partDescription: String
    var price: Double
    var quantityInStock: Int
    // Add more properties as needed
}
