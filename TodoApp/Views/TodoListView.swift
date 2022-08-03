//
//  TodoListView.swift
//  TodoApp
//
//  Created by 김태성 on 2022/08/03.
//

import SwiftUI

struct TodoListView: View {
    
    @StateObject var todoListVM = TodoListViewModel()
    
    var body: some View {
        List {
            ForEach(todoListVM.todoList) { item in
                TodoListRowView(
                    todo: item,
                    onCompletedToggle: {
                        todoListVM.updateItem(item: item.onCompletedToggle())
                    }
                )
            }
            .onDelete(perform: todoListVM.onDelete)
            .onMove(perform: todoListVM.onMove)
        }
        .navigationTitle("Todo List")
        .navigationBarItems(leading: EditButton(), trailing: NavigationLink(destination: {
            AddTodoView { todo in
                todoListVM.onSave(item: todo)
            }
        }, label: {
            Text("Add Item")
        }))
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TodoListView()
        }
    }
}
