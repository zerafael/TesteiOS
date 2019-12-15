//
//  InfoViewController.swift
//  TesteiOS
//
//  Created by José Rafael Ferraz Pacheco on 13/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import UIKit

private let cellIdentifier = "statementCellIdentifier"
private let headerIdentifier = "accountHeaderIdentifier"

class AccountViewController: UIViewController {
    
    var presenter: AccountPresenter! = nil
    
    var accountInfoView: AccountInfoView!
    
    var statements: [Statement]!
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.allowsSelection = false
        table.register(HeaderStatementsView.self, forHeaderFooterViewReuseIdentifier: headerIdentifier)
        table.register(StatementTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupHandlers()
        
        presenter = AccountPresenter(delegate: self)
        presenter.checkLogged()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func setupView() {
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        accountInfoView = AccountInfoView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 231))
        
        view.addSubview(accountInfoView)
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: accountInfoView.bottomAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setupHandlers() {
        accountInfoView.logoutButton.addTarget(self, action: #selector(handleLogout), for: .touchUpInside)
    }
    
    @objc func handleLogout() {
        self.presenter.handleLogout()
    }
}

extension AccountViewController: AccountDelegate {
    func setAccountInfo(user: User) {
        accountInfoView.nameInput.text = user.name
        accountInfoView.accountNumberInput.text = Formatter().formatBankAccount(agency: user.agency, account: user.bankAccount)
        accountInfoView.balanceInput.text = Formatter().formatCurrency(value: user.balance)
    }
    
    func setStatements(statements: [Statement]) {
        self.statements = statements
        tableView.reloadData()
    }
    
    func logoutSucceed() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension AccountViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: headerIdentifier) as? HeaderStatementsView
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (statements != nil) {
            return statements.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let statement = statements[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? StatementTableViewCell
        
        cell?.titleInput.text = statement.title
        cell?.dateInput.text = statement.date
        cell?.descInput.text = statement.desc
        cell?.valueInput.text = Formatter().formatCurrency(value: statement.value)
        
        return cell!
    }
}
