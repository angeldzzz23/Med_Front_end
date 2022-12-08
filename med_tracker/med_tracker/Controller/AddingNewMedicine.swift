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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func addMedicineButtonTapped(_ sender: Any) {
        let medicineName = medName.text!
        let medicineAmount = medAmount.text!
        let medicineTime = medTime.text!
        
        
        
    }
    
}
