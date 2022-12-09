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
        //Define URL
        guard let url = URL(string: "http://143.198.178.220:8000/medicine/create") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let body: [String: AnyHashable] = [
            "name": "Example",
            "type": "1",
            "days": [1,2,3,4,5,6,7],
            "time": "18:00"
        ]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        //Make request
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                print("Success: \(response)")
            }
            catch {
                print(error)
            }
            
        }
        task.resume()
        
        
        
        
        
    }
    
}
