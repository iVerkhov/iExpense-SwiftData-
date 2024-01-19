//
//  View-ExpenseStyle.swift
//  iExpenseSwiftData
//
//  Created by Игорь Верхов on 23.08.2023.
//

import SwiftUI

extension View {
    func style(for item: ExpenseItem) -> some View {
        if item.amount < 10 {
            return self.foregroundStyle(.green)
        } else if item.amount < 100 {
            return self.foregroundStyle(.blue)
        } else {
            return self.foregroundStyle(.red)
        }
    }
}
