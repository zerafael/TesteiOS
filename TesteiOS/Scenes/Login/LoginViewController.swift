//
//  ViewController.swift
//  TesteiOS
//
//  Created by José Rafael Ferraz Pacheco on 10/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    var presenter: LoginPresenter! = nil
    
    let logoImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "logo"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let loginTextField: UITextField = {
        let textField = UITextField()
        textField.setLeftPadding(13)
        textField.setRightPadding(13)
        textField.backgroundColor = .white
        textField.placeholder = "User"
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(rgb: "#DCE2EE").cgColor
        return textField
    }()
    
    let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.setLeftPadding(13)
        textField.setRightPadding(13)
        textField.backgroundColor = .white
        textField.placeholder = "Password"
        textField.layer.cornerRadius = 4
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(rgb: "#DCE2EE").cgColor
        return textField
    }()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.tintColor = .white
        button.layer.cornerRadius = 4
        button.backgroundColor = UIColor(rgb: "#3B48EE")
        
        return button
    }()
    
    lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [loginTextField, passwordTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 21
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        loginButton.addTarget(self, action: #selector(handleLoginButton), for: .touchUpInside)
        
        presenter = LoginPresenter(delegate: self)
    }
    
    func setupLayout() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        view.backgroundColor = .white
        
        view.addSubview(logoImageView)
        view.addSubview(textFieldStackView)
        view.addSubview(loginButton)
        
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 56).isActive = true
        
        textFieldStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textFieldStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 16).isActive = true
        textFieldStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
        
        loginTextField.leftAnchor.constraint(equalTo: textFieldStackView.leftAnchor).isActive = true
        loginTextField.rightAnchor.constraint(equalTo: textFieldStackView.rightAnchor).isActive = true
        loginTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        passwordTextField.leftAnchor.constraint(equalTo: textFieldStackView.leftAnchor).isActive = true
        passwordTextField.rightAnchor.constraint(equalTo: textFieldStackView.rightAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        loginButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 190).isActive = true
    }
    
    @objc func handleLoginButton() {
        presenter.handleLogin(user: loginTextField.text!, password: passwordTextField.text!)
    }
}

extension LoginViewController: LoginDelegate {
    func loginSucceed() {
        self.navigationController?.popViewController(animated: true)
    }
}
