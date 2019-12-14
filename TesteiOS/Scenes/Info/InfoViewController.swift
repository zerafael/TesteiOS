//
//  InfoViewController.swift
//  TesteiOS
//
//  Created by José Rafael Ferraz Pacheco on 13/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        
        if (!UserDefaults.standard.bool(forKey: "logged")) {
            self.navigationController?.pushViewController(LoginViewController(), animated: false)
        }
        
        setupView()
    }
    
    func setupView() {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

}
