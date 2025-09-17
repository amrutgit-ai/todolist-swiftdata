//
//  SwiftdataTodoListApp.swift
//  SwiftdataTodoList
//
//  Created by Amrut.Gaikwad on 16/09/25.
//

import SwiftUI
import SwiftData

@main
struct SwiftdataTodoListApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView( newTask: "")
        }
        .modelContainer(for: TodoItem.self)
    }
}
