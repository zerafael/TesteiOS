//
//  InfoStatementTableViewCell.swift
//  TesteiOS
//
//  Created by José Rafael Ferraz Pacheco on 13/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import UIKit

class StatementTableViewCell: UITableViewCell {
    
    let titleInput: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.text = "Pagamento"
        label.textColor = UIColor(rgb: "#A8B4C4")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let dateInput: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 12)
        label.text = "12/12/2018"
        label.textColor = UIColor(rgb: "#A8B4C4")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let descInput: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 16)
        label.text = "Conta de Luz"
        label.textColor = UIColor(rgb: "#485465")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let valueInput: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        label.text = "R$1.000,00"
        label.textColor = UIColor(rgb: "#485465")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupShadow()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let margins = UIEdgeInsets(top: 5, left: 16, bottom: 10, right: 16)
        frame = frame.inset(by: margins)
    }
    
    func setupView() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(rgb: "#DBDFE3", alpha: 0.3).cgColor
        self.addSubview(titleInput)
        self.addSubview(dateInput)
        self.addSubview(descInput)
        self.addSubview(valueInput)
        
        titleInput.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        titleInput.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 13).isActive = true
        
        dateInput.topAnchor.constraint(equalTo: self.topAnchor, constant: 17).isActive = true
        dateInput.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        
        descInput.leftAnchor.constraint(equalTo: titleInput.leftAnchor).isActive = true
        descInput.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -13).isActive = true
        
        valueInput.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
        valueInput.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true
    }
    
    func setupShadow() {
        self.layer.shadowColor = UIColor(rgb: "#D9E2E9").cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 1)
        self.layer.shadowOpacity = 0.5
        self.layer.masksToBounds = false;
        self.clipsToBounds = false;
    }
}
