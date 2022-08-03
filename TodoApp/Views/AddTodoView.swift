//
//  AddItemView.swift
//  TodoApp
//
//  Created by 김태성 on 2022/08/03.
//

import SwiftUI

struct AddTodoView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let onSave: (_ todo: TodoModel) -> Void
    let id: String = UUID().uuidString
    @StateObject var addTodoVM = AddTodoViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                TextField("Todo", text: $addTodoVM.title)
                    .padding()
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(12)
                    .onSubmit {
                        onSaveClick()
                    }
            }
            Button {
                if addTodoVM.canSave() {
                    onSaveClick()
                }
            } label: {
                Text("Save")
                    .foregroundColor(.white)
                    .font(.headline)
                    .frame(height: 56)
                    .frame(maxWidth: .infinity)
                    .background(.primary)
                    .cornerRadius(12)
            }
        }
        .padding()
        .navigationTitle("Add Todo")
    }
    
    func onSaveClick() {
        let todo: TodoModel = addTodoVM.getTodo(id: id)
        onSave(todo)
        presentationMode.wrappedValue.dismiss()
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddTodoView { todo in
                
            }
        }
    }
}
