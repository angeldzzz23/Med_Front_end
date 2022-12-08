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
    var medicines = [Medicine]()
    
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
        
        let parameters = ["name" : medicineName, "type" : medicineAmount, "time": medicineTime]
        let url = URL(string: "http://143.198.178.220:8000/medicine/create")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let task = URLSession.shared.dataTask(with: request) { (data,response,error) in
            if let error = error {
                //Handle error
                print("Error sending request: \(error)")
                return
            }
            //DATA RESPONSE FROM API POST
            //ASIGNING IT TO A MEDICINE OBJECT
           if let data = data {
                //Parse the response data and create the medicine
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    
                    //Parse the JSON data and create the medicine object
                    let medicine = Medicine(Medname: json["name"] as! String,MedCount: json["type"] as! String, medTime: json["time"] as! String)
                    
                    //Add medicine to the array
                    self.medicines.append(medicine)
                } catch {
                    print("Error parsing repsonse: \(error)")
                }
            }
            
        }
        
        task.resume()
        
        
        
        
        
    }
    
}
