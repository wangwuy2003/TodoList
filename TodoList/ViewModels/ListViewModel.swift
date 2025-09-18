//
//  ListViewModel.swift
//  TodoList
//
//  Created by MacMini A6 on 18/9/25.
//

import Foundation
import Combine
import SwiftUI

/*
 CRUD FUNCTIONS
    Create
    Read
    Update
    Delete
 */

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "This is the first item", isCompleted: false),
            ItemModel(title: "This is the second item", isCompleted: false),
            ItemModel(title: "This is the third item", isCompleted: false),
            ItemModel(title: "This is the fourth item", isCompleted: false),
            ItemModel(title: "This is the fifth item", isCompleted: false),
            ItemModel(title: "This is the sixth item", isCompleted: false),
            ItemModel(title: "This is the seventh item", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
}
