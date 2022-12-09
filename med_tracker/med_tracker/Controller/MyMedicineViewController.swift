//
//  MyMedicineViewController.swift
//  med_tracker
//
//  Created by Angel Zambrano on 12/7/22.
//

import UIKit

class MyMedicineViewController: UIViewController {

    let tableview = UITableView()
    
    var medicines = [UserMedicine]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Medicine"
        setUpViews()
        
      
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        API.gettingUserMedications { result in
            switch result {
            case .success(let med):
                
                if let mediciness = med?.data?.user_medicine {
                   
                    
                    DispatchQueue.main.async {
                        self.medicines = mediciness
                        self.tableview.reloadData()
                    }
                }
            case .failure(let err):
                print("error", err.localizedDescription)
            }
        }
        
    }
    
    
    func setUpViews() {
        view.addSubview(tableview)
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.register(MedicineTableViewCell.self, forCellReuseIdentifier: MedicineTableViewCell.identifier)

        
        
        tableview.translatesAutoresizingMaskIntoConstraints = false
        tableview.dataSource = self
        
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
           
    }
}




extension MyMedicineViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MedicineTableViewCell.identifier, for: indexPath) as! MedicineTableViewCell
        
        let med = medicines[indexPath.row]
        
        // TODO: clean this up please
        if med.type == 1 {
            cell.daysLbl.text = "daily"
        } else {
            cell.daysLbl.text = "every other day"
            var fullStr = ""
            let days = med.days
            for (k,v) in days {
                fullStr.append("\(v), ")
            }
            // removing the last command
            if fullStr != "" {
                fullStr.remove(at: fullStr.index(before: fullStr.endIndex))
                fullStr.remove(at: fullStr.index(before: fullStr.endIndex))
                cell.daysLbl.text = fullStr
            }
            
        }
        
        
        cell.medicineNameLbl.text =  med.name
        
       cell.accessoryType = .disclosureIndicator
        return cell

    }
    
    
}
