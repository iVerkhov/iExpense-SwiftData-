//
//  ExpenseList.swift
//  iExpenseSwiftData
//
//  Created by Игорь Верхов on 18.01.2024.
//

import SwiftData
import SwiftUI

struct ExpenseList: View {
    @Environment(\.modelContext) var modelContext
    @Query private var expenses: [ExpenseItem]
    
    let localCurrency = Locale.current.currency?.identifier ?? "USD"
    
    var body: some View {
        List {
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.name)
                            .font(.headline)
                        Text(item.type)
                    }
                    Spacer()
                    
                    Text(item.amount, format: .localCurrency)
                        .style(for: item)
                }
                .accessibilityElement()
                .accessibilityLabel("\(item.name) \(item.amount.formatted(.currency(code: "USD")))")
                .accessibilityHint(item.type)
            }
            .onDelete(perform: removeItems)
        }
        
    }
    
    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            modelContext.delete(expenses[offset])
        }
    }
    
    init(type: String, sortOrder: [SortDescriptor<ExpenseItem>]) {
        _expenses = Query(
                        filter: #Predicate { item in
                                if type == "All" {
                                    return true
                                } else {
                                    return item.type == type
                                }
                            },
                        sort: sortOrder)
    }
}
#Preview {
    ExpenseList(type: "All", sortOrder: [SortDescriptor(\ExpenseItem.amount) ])
        .modelContainer(for: ExpenseItem.self)
}
