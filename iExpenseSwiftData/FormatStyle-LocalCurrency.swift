//
//  FormatStyle-LocalCurrency.swift
//  iExpenseSwiftData
//
//  Created by Игорь Верхов on 23.08.2023.
//

import Foundation

extension FormatStyle where Self == FloatingPointFormatStyle<Double>.Currency {
    static var localCurrency: Self {
        .currency(code: Locale.current.currency?.identifier ?? "USD")
    }
}
