//
//  ExpenseItem.swift
//  iExpenseSwiftData
//
//  Created by Игорь Верхов on 17.08.2023.
//

import Foundation
import SwiftData

@Model
class ExpenseItem {
    let name: String
    let type: String
    let amount: Double
    
    init(name: String, type: String, amount: Double) {
        self.name = name
        self.type = type
        self.amount = amount
    }
}
