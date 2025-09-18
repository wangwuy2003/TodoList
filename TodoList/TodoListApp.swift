//
//  TodoListApp.swift
//  TodoList
//
//  Created by MacMini A6 on 18/9/25.
//

import SwiftUI

/*
 MVVM Architecture
 Model - data point
 View - UI
 ViewModel - manager model for view
 
 
 */

@main
struct TodoListApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
