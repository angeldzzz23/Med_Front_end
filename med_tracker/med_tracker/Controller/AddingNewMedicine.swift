//
//  AddingNewMedicine.swift
//  med_tracker
//
//  Created by Angel Zambrano on 12/7/22.
//
import Foundation
import UIKit


class AddingNewMedicine: UIViewController {
    //Variable to keep track of medicines (Object)
    
    //Crete the variables for the adding of the medicine
    
    @IBOutlet weak var medName: UITextField!
    @IBOutlet weak var medAmount: UITextField!
    @IBOutlet weak var medTime: UITextField!
    @IBOutlet weak var medDays: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addMedicineButtonTapped(_ sender: Any) {
        let medName = medName.text!
        let medicineAmount = medAmount.text!
        let medicineTime = medTime.text!
        // Get the string of days from the text field
        let daysString = medDays.text!

        // Split the string of days on a delimiter character (e.g. comma or space)
        let days = daysString.components(separatedBy: ",")

        // Create a dictionary of days where the keys are the individual days and the values are true
        let daysDict = days.reduce(into: [String: Bool]()) { (dict, day) in
            dict[day] = true
        }
        
        //CAll API Function on button press
        
        
    }
    
}
