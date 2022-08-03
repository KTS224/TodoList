//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by 김태성 on 2022/08/03.
//

import SwiftUI

@main
struct TodoAppApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                TodoListView()
            }
        }
    }
}
