//
//  ListRowView.swift
//  TodoList
//
//  Created by MacMini A6 on 18/9/25.
//

import SwiftUI

struct ListRowView: View {
    let item: ItemModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

#Preview {
    ListRowView(item: ItemModel.item1)
}
