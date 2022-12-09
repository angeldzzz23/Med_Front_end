//
//  AddingNewMedicine.swift
//  med_tracker
//
//  Created by Angel Zambrano on 12/7/22.
//
import Foundation
import UIKit


class AddingNewMedicine: UIViewController {
    //Crete the variables for the adding of the medicine
    
    @IBOutlet weak var dateTF: UITextField!
    @IBOutlet weak var medName: UITextField!
    var typeChoice = ""
    //Values above represent numbers to append to array
    var daysChoice = [Int]()
    
    //---------------------Days of the week
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .time
        datePicker.addTarget(self, action: #selector(dateChange(datePicker:)), for: UIControl.Event.valueChanged)
        datePicker.frame.size = CGSize(width: 0, height: 300)
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.locale = NSLocale(localeIdentifier: "en_GB") as Locale
        
        dateTF.inputView = datePicker
        dateTF.text = formatDate(date: Date()) //todays date
    }
    
    //TIME PICKER FUNCTION
    @objc func dateChange(datePicker: UIDatePicker) {
        dateTF.text = formatDate(date: datePicker.date)
        
    }
    //FORMAT DATE
    func formatDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    //Method to add to array of days click = add,click again = delete
    
    
    //BUTTONS and assigning data
    
    @IBAction func mondayButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if(sender.isSelected == true) {
            sender.backgroundColor = UIColor.black
            sender.setTitleColor(UIColor.blue, for: .normal)
            daysChoice.append(1)
        }
        else {
            sender.backgroundColor = UIColor.white
            sender.setTitleColor(UIColor.blue, for: .normal)
            while daysChoice.contains(1) {
                if let itemToRemoveIndex = daysChoice.firstIndex(of: 1) {
                    daysChoice.remove(at: itemToRemoveIndex)
                }
            }
           
        }
        
        
    }
    
    
    @IBAction func tuesdayButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if(sender.isSelected == true) {
            sender.backgroundColor = UIColor.black
            sender.setTitleColor(UIColor.blue, for: .normal)
            daysChoice.append(2)
        }
        else {
            sender.backgroundColor = UIColor.white
            sender.setTitleColor(UIColor.blue, for: .normal)
            while daysChoice.contains(2) {
                if let itemToRemoveIndex = daysChoice.firstIndex(of: 2) {
                    daysChoice.remove(at: itemToRemoveIndex)
                }
            }
            
        }
    }
    
    
    @IBAction func wednesdayButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if(sender.isSelected == true) {
            sender.backgroundColor = UIColor.black
            sender.setTitleColor(UIColor.blue, for: .normal)
            daysChoice.append(3)
        }
        else {
            sender.backgroundColor = UIColor.white
            sender.setTitleColor(UIColor.blue, for: .normal)
            while daysChoice.contains(3) {
                if let itemToRemoveIndex = daysChoice.firstIndex(of: 3) {
                    daysChoice.remove(at: itemToRemoveIndex)
                }
            }
        }
    }
    
    
    @IBAction func thursdayButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if(sender.isSelected == true) {
            sender.backgroundColor = UIColor.black
            sender.setTitleColor(UIColor.blue, for: .normal)
            daysChoice.append(4)
        }
        else {
            sender.backgroundColor = UIColor.white
            sender.setTitleColor(UIColor.blue, for: .normal)
            while daysChoice.contains(4) {
                if let itemToRemoveIndex = daysChoice.firstIndex(of: 4) {
                    daysChoice.remove(at: itemToRemoveIndex)
                }
            }
        }
    }
    
    @IBAction func fridayButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if(sender.isSelected == true) {
            sender.backgroundColor = UIColor.black
            sender.setTitleColor(UIColor.blue, for: .normal)
            daysChoice.append(5)
        }
        else {
            sender.backgroundColor = UIColor.white
            sender.setTitleColor(UIColor.blue, for: .normal)
            while daysChoice.contains(5) {
                if let itemToRemoveIndex = daysChoice.firstIndex(of: 5) {
                    daysChoice.remove(at: itemToRemoveIndex)
                }
            }
        }
    }
    
    @IBAction func saturdayButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if(sender.isSelected == true) {
            sender.backgroundColor = UIColor.black
            sender.setTitleColor(UIColor.blue, for: .normal)
            daysChoice.append(6)
        }
        else {
            sender.backgroundColor = UIColor.white
            sender.setTitleColor(UIColor.blue, for: .normal)
            while daysChoice.contains(6) {
                if let itemToRemoveIndex = daysChoice.firstIndex(of: 6) {
                    daysChoice.remove(at: itemToRemoveIndex)
                }
            }
        }
    }
    
    @IBAction func sundayButton(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        
        if(sender.isSelected == true) {
            sender.backgroundColor = UIColor.black
            sender.setTitleColor(UIColor.blue, for: .normal)
            daysChoice.append(7)
        }
        else {
            sender.backgroundColor = UIColor.white
            sender.setTitleColor(UIColor.blue, for: .normal)
            while daysChoice.contains(7) {
                if let itemToRemoveIndex = daysChoice.firstIndex(of: 7) {
                    daysChoice.remove(at: itemToRemoveIndex)
                }
            }
        }
    }
    //METHOD TO CHANGE THE TIMES STRING
    
    
    
    
    
    //Should be last function to access global variabels to send to API
    @IBAction func addMedicineButtonTapped(_ sender: Any) {
        //DEFINE THE INPUTS
        let medicineName = medName.text!
        let timeChosen = dateTF.text!
        
        //Define URL
        guard let url = URL(string: "http://143.198.178.220:8000/medicine/create") else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        if (daysChoice.count == 7){
            typeChoice = "1"
        }
        else {
            typeChoice = "2"
        }
        
        let body: [String: AnyHashable] = [
            "name": medicineName,
            "type": typeChoice,
            "days": daysChoice,
            "time": timeChosen
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
