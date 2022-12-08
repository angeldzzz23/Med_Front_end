//
//  MedicineTableViewCell.swift
//  med_tracker
//
//  Created by Angel Zambrano on 12/7/22.
//

import UIKit

class MedicineTableViewCell: UITableViewCell {

    static let identifier = "MedicineTableViewCell"
    
    let sv: UIStackView = {
       let sv = UIStackView()
        sv.axis = .vertical
        return sv
    }()
    
    let medicineNameLbl = UILabel()
    let daysLbl = UILabel()
    
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUpContentView()
        
        
    }
    
    func setUpContentView() {
        // adding the label
        contentView.addSubview(sv)
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        sv.addArrangedSubview(medicineNameLbl)
        medicineNameLbl.translatesAutoresizingMaskIntoConstraints = false
        medicineNameLbl.text = "My Medicine"
        
        sv.addArrangedSubview(daysLbl)
        daysLbl.text = "Daily"
        daysLbl.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
        NSLayoutConstraint.activate([
            sv.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            sv.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
