//
//  AppDelegate.swift
//  TesteiOS
//
//  Created by José Rafael Ferraz Pacheco on 10/12/19.
//  Copyright © 2019 José Rafael Ferraz Pacheco. All rights reserved.
//

import UIKit
import PKHUD

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        PKHUD.sharedHUD.contentView = PKHUDProgressView()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        window?.rootViewController = UINavigationController(rootViewController: LoginViewController())
        
        return true
    }
}

