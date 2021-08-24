//
//  Course.swift
//  OpenBonCalendrier
//
//  Created by Ethan Hanlon on 8/23/21.
//

import Foundation
import CloudKit

/// Represents a course that the user might be taking during a semester
struct Course {
    /// Name of the course
    let name: String
    /// Professor teaching the course
    let professor: String
    /// Physical location where course meets
    let meetingPlace: String
    /// To dos in this course (including homework, exams, etc)
    let assignments: [ToDo]
    /// Days of the week when this class meets
    let days: [MeetingDay]
    
    /// Saves the record
    /// - Parameter completionHandler: Executed on save. Includes the saved CKRecord and any error that may have happened
    func save(completionHandler: @escaping (CKRecord?, Error?) -> Void) {
        // Create CloudKit Record
        let record = CKRecord(recordType: "class." + name)
        // Set CKRecord keys
        record.setValuesForKeys([
            "name": name,
            "professor": professor,
            "meetingPlace": meetingPlace,
            "assignments": assignments,
            "days": days
        ])
        
        // Access private iCloud database
        let container = CKContainer.default()
        let database = container.privateCloudDatabase
        
        // Save to database
        database.save(record) { savedRecord, error in
            // Execute completion handler
            completionHandler(savedRecord, error)
        }
    }
    
}

// MARK: - DayOfWeek
/// Represents a day of the week when a course is meeting
enum DayOfWeek {
    case sunday, monday, tuesday, wednesday
    case thursday, friday, saturday
}

// MARK: - MeetingDay
/// Represents a day when the course is meeting
struct MeetingDay {
    /// Day of the week when course meets
    let day: DayOfWeek
    /// Time when course starts
    let timeStart: Time
    /// Time when course ends
    let timeEnd: Time
}

// MARK: - Time
struct Time {
    let hour: Int
    let minute: Int
}
