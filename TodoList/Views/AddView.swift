//
//  AddView.swift
//  TodoList
//
//  Created by MacMini A6 on 18/9/25.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    @State private var textFieldText: String = ""
    @State private var someColor = #colorLiteral(red: 0, green: 0.5690457821, blue: 0.5746168494, alpha: 1)
    @EnvironmentObject var listViewModel: ListViewModel
    @State private var alertTitle: String = ""
    @State private var showAlert: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    TextField("Type something here...", text: $textFieldText)
                        .foregroundStyle(.white)
                        .font(.headline)
                        .padding(.horizontal)
                        .frame(height: 55)
                        .background(Color(someColor))
                        .clipShape(.rect(cornerRadius: 10))
                    
                    Button {
                        saveButtonPressed()
                    } label: {
                        Text("Save".uppercased())
                            .font(.headline)
                            .padding()
                            .padding(.horizontal)
                            .foregroundStyle(.white)
                            .background(Color.accentColor)
                            .clipShape(.rect(cornerRadius: 10))
                    }

                }
                .padding(14)
            }
            .navigationTitle("Add an Item ✏️")
            .alert(isPresented: $showAlert) {
                getAlert()
            }
        }
    }
    
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            dismiss.callAsFunction()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long!!! 😡"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

#Preview {
    AddView()
        .environmentObject(ListViewModel())
}
