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
}

struct InventoryItem {
    var partName: String
    var partDescription: String
    var price: Double
    var quantityInStock: Int
    // Add more properties as needed
}

class CarRepairInventory {
    var carInventory: [Car: [InventoryItem]] = [:]

    // Function to add inventory items for a car
    func addInventory(for car: Car, items: [InventoryItem]) {
        carInventory[car] = items
    }

    // Function to retrieve inventory items for a car
    func getInventory(for car: Car) -> [InventoryItem]? {
        return carInventory[car]
    }
}
