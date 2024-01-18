//
//  ContentView.swift
//  iExpense
//
//  Created by Игорь Верхов on 16.08.2023.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [ExpenseItem]
    
    @State private var sortOrder = [
        SortDescriptor(\ExpenseItem.amount)
    ]
    
    @State private var type = "All"
    
    @State private var showingSheet = false
    
    var body: some View {
        NavigationStack {
            ExpenseList(type: type, sortOrder: sortOrder)
                .navigationTitle("iExpense")
                .sheet(isPresented: $showingSheet) {
                    AddView()
                }
                .toolbar {
//                Button("Add expense", systemImage: "plus") {
//                    showingSheet.toggle()
//                }
                    NavigationLink() {
                        AddView()
                    } label: {
                        Label("Add expense", systemImage: "plus")
                    }
                    
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $sortOrder) {
                            Text("Sort by name A-Z")
                                .tag([
                                    SortDescriptor(\ExpenseItem.name),
                                    SortDescriptor(\ExpenseItem.amount)
                                ])
                            Text("Sort by name Z-A")
                                .tag([
                                    SortDescriptor(\ExpenseItem.name, order: .reverse),
                                    SortDescriptor(\ExpenseItem.amount)
                                ])
                            Text("Cheapest first")
                                .tag([
                                    SortDescriptor(\ExpenseItem.amount),
                                    SortDescriptor(\ExpenseItem.name)
                                ])
                            Text("Most expensive first")
                                .tag([
                                    SortDescriptor(\ExpenseItem.amount, order: .reverse),
                                    SortDescriptor(\ExpenseItem.name)
                                ])
                        }
                    }
                    
                    Menu("Filter", systemImage: "line.3.horizontal.decrease.circle") {
                        Picker("Filter", selection: $type) {
                            Text("All")
                                .tag("All")
                            ForEach(AddView.types, id:\.self) {
                                Text($0)
                                    .tag($0)
                            }
                        }
                    }
                }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ExpenseItem.self)
}
