//
//  ItemModel.swift
//  TodoList
//
//  Created by MacMini A6 on 18/9/25.
//

import Foundation

//immutable struct


struct ItemModel: Identifiable, Codable {
    var id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
    
    static var item1 = ItemModel(title: "First title", isCompleted: false)
}
