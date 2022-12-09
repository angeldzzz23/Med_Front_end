//
//  TimeLine.swift
//  med_tracker
//
//  Created by Angel Zambrano on 12/9/22.
//

import Foundation

struct Timeline: Codable {
    let success: Bool
    let data: Data_Class?
}

// DataClass.swift

import Foundation

// MARK: - DataClass
struct Data_Class: Codable {
    let fullday, date: String
    let timeline: [TimelineElement]?
}

// TimelineElement.swift

import Foundation

// MARK: - TimelineElement
struct TimelineElement: Codable {
    let id: Int
    let name, time, type: String
    let quantity: Int
    let taken: Bool
    let days: [String]?
}
