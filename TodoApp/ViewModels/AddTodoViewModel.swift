//
//  AddTodoViewModel.swift
//  TodoApp
//
//  Created by 김태성 on 2022/08/03.
//

import Foundation

class AddTodoViewModel: ObservableObject {
    @Published var title: String = ""
    
    func canSave() -> Bool {
        if title.isEmpty {
            return false
        } else if title.count < 5 {
            return false
        }
        return true
    }
    
    func getTodo(id: String = UUID().uuidString) -> TodoModel {
        return TodoModel(id: id, title: title, isCompleted: false)
    }
}
