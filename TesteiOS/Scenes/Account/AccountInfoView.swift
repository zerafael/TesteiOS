//
//  InfoView.swift
//  TesteiOS
//
//  Created by José Rafael Ferraz Pacheco on 13/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import UIKit

class AccountInfoView: UIView {
    
    let nameInput: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 25)
        label.text = "Jose da Silva Teste"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let logoutButton: UIButton = {
        let button = UIButton()
        let icon = UIImage(named: "logout")
        button.setImage(icon, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let accountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 12)
        label.text = "Conta"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let accountNumberInput: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue-Light", size: 25)
        label.text = "2050 / 01.111222-4"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let balanceLabel: UILabel = {
       let label = UILabel()
       label.font = UIFont(name: "HelveticaNeue", size: 12)
       label.text = "Saldo"
       label.textColor = .white
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    let balanceInput: UILabel = {
       let label = UILabel()
       label.font = UIFont(name: "HelveticaNeue-Light", size: 25)
       label.text = "R$1.000,00"
       label.textColor = .white
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor(rgb: "#3B49EE")
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.addSubview(nameInput)
        self.addSubview(logoutButton)
        self.addSubview(accountLabel)
        self.addSubview(accountNumberInput)
        self.addSubview(balanceLabel)
        self.addSubview(balanceInput)
        
        nameInput.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        nameInput.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 18).isActive = true
        
        logoutButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 40).isActive = true
        logoutButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -13).isActive = true
        
        
        accountLabel.topAnchor.constraint(equalTo: nameInput.bottomAnchor, constant: 28).isActive = true
        accountLabel.leftAnchor.constraint(equalTo: nameInput.leftAnchor).isActive = true
        
        accountNumberInput.topAnchor.constraint(equalTo: accountLabel.bottomAnchor, constant: 5).isActive = true
        accountNumberInput.leftAnchor.constraint(equalTo: nameInput.leftAnchor).isActive = true
        
        balanceLabel.topAnchor.constraint(equalTo: accountNumberInput.bottomAnchor, constant: 21).isActive = true
        balanceLabel.leftAnchor.constraint(equalTo: nameInput.leftAnchor).isActive = true
        
        balanceInput.topAnchor.constraint(equalTo: balanceLabel.bottomAnchor, constant: 5).isActive = true
        balanceInput.leftAnchor.constraint(equalTo: nameInput.leftAnchor).isActive = true
    }
}
