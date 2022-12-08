//
//  Medicine.swift
//  med_tracker
// Object To keep track of of the medicines that are sent to the API POST call in the AddingNewMedicine View
//  Created by Arturo Rodriguez on 12/7/22.
//

import Foundation

class Medicine {
    let Medname: String
    let MedCount: String
    let medTime: String
    
    init(Medname: String, MedCount: String, medTime: String) {
        self.Medname = Medname
        self.MedCount = MedCount
        self.medTime = medTime
    }
}
