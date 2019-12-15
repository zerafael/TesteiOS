//
//  HeaderStatementsView.swift
//  TesteiOS
//
//  Created by José Rafael Ferraz Pacheco on 14/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import UIKit

class HeaderStatementsView: UITableViewHeaderFooterView {

    let title: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "HelveticaNeue", size: 17)
        label.text = "Recentes"
        label.textColor = UIColor(rgb: "#485465")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        self.tintColor = .white
        self.addSubview(title)
        
        title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 18).isActive = true
        title.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
