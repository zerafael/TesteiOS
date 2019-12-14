//
//  InfoViewController.swift
//  TesteiOS
//
//  Created by José Rafael Ferraz Pacheco on 13/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {
    
    var accountInfoView: AccountInfoView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkLogged()
        
        setupView()
        setupHandlers()
    }
    
    func checkLogged() {
        if (!UserDefaults.standard.bool(forKey: "logged")) {
            self.navigationController?.pushViewController(LoginViewController(), animated: false)
        }
    }
    
    func setupView() {
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        accountInfoView = AccountInfoView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 231))
        
        view.addSubview(accountInfoView)
    }
    
    func setupHandlers() {
        accountInfoView.logoutButton.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
    }
    
    @objc func handleLogout() {
        UserDefaults.standard.removeObject(forKey: "logged")
        checkLogged()
    }
}

extension AccountViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

