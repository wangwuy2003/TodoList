//
//  ListView.swift
//  TodoList
//
//  Created by MacMini A6 on 18/9/25.
//

import SwiftUI

struct ListView: View {
    @State private var someColor = #colorLiteral(red: 0, green: 0.5628422499, blue: 0.3188166618, alpha: 1)
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)).opacity(0.3),Color(#colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1))]),
                               startPoint: .top,
                               endPoint: .bottom)
                .ignoresSafeArea()
                
                if listViewModel.items.isEmpty {
//                    ContentUnavailableView("No items", systemImage: "heart.fill", description: Text("Add first item."))
                    NoItemView()
                        .transition(AnyTransition.opacity.animation(.easeIn))
                } else {
                    List {
                        ForEach(listViewModel.items) { item in
                            ListRowView(item: item)
                                .onTapGesture {
                                    withAnimation(.linear) {
                                        listViewModel.updateItem(item: item)
                                    }
                                }
                        }
                        .onDelete(perform: listViewModel.deleteItem)
                        .onMove(perform: listViewModel.moveItem)
                    }
                    .listStyle(PlainListStyle())
//                    .scrollContentBackground(.hidden)
//                    .background(Color.clear)
                }
            }
            .navigationTitle("Todo List 🥙")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add", destination: AddView())
                }
            }
        }
    }
}


#Preview {
    NavigationStack {
        ListView()
    }
    .environmentObject(ListViewModel())
}
