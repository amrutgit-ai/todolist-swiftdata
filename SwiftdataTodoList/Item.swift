//
//  Item.swift
//  SwiftdataTodoList
//
//  Created by Amrut.Gaikwad on 16/09/25.
//

import SwiftData
import Foundation

@Model
final class TodoItem {
    var task: String
    var isCompleted: Bool
    var timestamp: Date
    
    init(task: String, isCompleted: Bool = false, timestamp: Date = .now) {
        self.task = task
        self.isCompleted = isCompleted
        self.timestamp = timestamp
    }
}
