//
//  ToTakeMedicineMedicineTableViewCell.swift
//  med_tracker
//
//  Created by Angel Zambrano on 12/9/22.
//

import UIKit

class ToTakeMedicineMedicineTableViewCell: UITableViewCell {

    let sv: UIStackView = {
       let sv = UIStackView()
        sv.axis = .vertical
        return sv
    }()
    
    let medicineNameLbl = UILabel()
    
    let quantity: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 12)
        return lbl
    }()
    
    var isTaken = false
    
    let button: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(buttonWasPressed), for: .touchUpInside)
        return btn
    }()
    
    func configure(istake: Bool) {
        self.isTaken = istake
        self.updateButton()
        
    }
    
    func configure(pillName: String) {
        self.medicineNameLbl.text = pillName
    }
    
    
    func configure(quantity: Int) {
        self.quantity.text = "\(quantity) Pill"
    }
    
    
    @objc func buttonWasPressed() {
        self.updateButton()
    }
    
    func updateButton() {
        if !isTaken {
            button.setImage(UIImage(systemName: "checkmark.circle.fill"), for: .normal)
            isTaken = true
        } else {
            button.setImage(UIImage(systemName: "checkmark.circle"), for: .normal)
            isTaken = false
        }
    }
    
    static let identifier = "ToTakeMedicineMedicineTableViewCell"
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
        medicineNameLbl.text = "Pill"
        
        sv.addArrangedSubview(quantity)
        quantity.text = "1 pill"
        quantity.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            sv.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            sv.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        
        contentView.addSubview(button)
        button.centerYAnchor.constraint(equalTo: sv.centerYAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16).isActive = true
        
        button.widthAnchor.constraint(equalToConstant: 30).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
