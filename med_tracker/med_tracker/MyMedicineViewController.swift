//
//  MyMedicineViewController.swift
//  med_tracker
//
//  Created by Angel Zambrano on 12/7/22.
//

import UIKit

class MyMedicineViewController: UIViewController {

    let tableview = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Medicine"
        setUpViews()
        
        
    }
    
    func setUpViews() {
        view.addSubview(tableview)
        tableview.backgroundColor = .red
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.register(MedicineTableViewCell.self, forCellReuseIdentifier: MedicineTableViewCell.identifier)

        
        tableview.backgroundColor = .red
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MedicineTableViewCell.identifier, for: indexPath) as! MedicineTableViewCell
       cell.accessoryType = .disclosureIndicator
        return cell

    }
    
    
}
