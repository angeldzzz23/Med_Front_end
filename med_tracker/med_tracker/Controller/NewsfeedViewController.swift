//
//  NewsfeedViewController.swift
//  med_tracker
//
//  Created by Angel Zambrano on 12/9/22.
//

import UIKit
import Foundation


class NewsfeedViewController: UIViewController {

    let tableview: UITableView = {
       let tb = UITableView()
        tb.backgroundColor = .green
        tb.translatesAutoresizingMaskIntoConstraints = false
        return tb
    }()
    
    var sectionNumberToTime: [Int: String] = [:]
    var sections: [String: [TimelineElement]] = [:]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        viewSetUp()

        API.gettingTimeline { res in
            switch res {
            case .success(let timeline):
                if let timeline = timeline {
                    if let data = timeline.data {
                        if let timelineelements = data.timeline {
                            self.organizingTime(timelin: timelineelements)
                            DispatchQueue.main.async {
                                self.tableview.reloadData()
                            }
                            
                        }
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
        
       
        
    }
    
    
    // TODO: refactor this later on
    // this is in charge of making sure that the feed is in order
    // the api itself should take care of that, so we can delete this later on
    func organizingTime(timelin: [TimelineElement]) {
        
        var aSet: Set = Set<Int>()
        
        
        
        
        for element in timelin {
            let nTime = element.time.prefix(2) + ":00"
            sections[String(nTime), default: [TimelineElement]()].append(element)
            
        }
        var count = 0
        
        var section2 = sections
        
        
        
        for (k,v) in sections {
            print(k, " ", v.count)
            // check if there is
            
            sectionNumberToTime[count] = k
            
            count += 1
        }

        
        
    }
    
    func viewSetUp() {
        view.addSubview(tableview)
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableview.register(ToTakeMedicineMedicineTableViewCell.self, forCellReuseIdentifier: ToTakeMedicineMedicineTableViewCell.identifier)
        
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



extension NewsfeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let tm = sectionNumberToTime[section]
        if let tm = tm {
            let count = sections[tm]?.count
            return count ?? 0
            
        }
        
        
        return 10
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let tm = sectionNumberToTime[section]
        
        return tm
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ToTakeMedicineMedicineTableViewCell.identifier, for: indexPath) as! ToTakeMedicineMedicineTableViewCell
        
        
        if let tm = sectionNumberToTime[indexPath.section] {
            if let sect = sections[tm] {
                let pill = sect[indexPath.row]
                cell.configure(pillName: pill.name)
                
            }
            
        }
        
        return cell
    }
    
    
}
