//
//  ToDo.swift
//  OpenBonCalendrier
//
//  Created by Ethan Hanlon on 8/23/21.
//

import Foundation
import CloudKit

/// Represents something "to do" in a course, for example 
struct ToDo {
    init(name: String, type: ToDoType, dueDate: Date, description: String) {
        self.name = name
        self.type = type
        self.dueDate = dueDate
        self.description = description
    }
    
    private let name: String
    private let type: ToDoType
    private let dueDate: Date
    private let description: String
}

enum ToDoType {
    case homework, project, essay, quiz, exam
}
