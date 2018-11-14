//
//  AppDelegate.swift
//  StackExchangeAPI
//
//  Created by Serxhio Gugo on 10/16/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupUI()
      
        
        return true
    }
    
    private func setupUI() {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let vc = StackExchangeMain()
        let navController = UINavigationController(rootViewController: vc)
        window?.rootViewController = navController
        
        configureAppearances()
    }
    
    private func configureAppearances() {
        UINavigationBar.appearance().barTintColor = .orange
        
    }

/*
     private func setupNavController() {
     view.backgroundColor = .white
     navigationItem.title = "Technology Now"
     navigationController?.navigationBar.barTintColor = UIColor.white
     navigationController?.navigationBar.prefersLargeTitles = true
     let attributes = [NSAttributedString.Key.foregroundColor : UIColor(red: 0, green: 0.6471, blue: 0.3843, alpha: 1.0)]
     navigationController?.navigationBar.largeTitleTextAttributes = attributes
     navigationController?.navigationBar.titleTextAttributes = attributes
     }
*/


}

