//
//  iExpenseApp.swift
//  iExpense
//
//  Created by Игорь Верхов on 16.08.2023.
//

import SwiftUI

@main
struct iExpenseApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ExpenseItem.self)
    }
}
