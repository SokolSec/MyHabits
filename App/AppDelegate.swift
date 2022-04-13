//
//  AppDelegate.swift
//  MyHabits
//
//  Created by Даниил Сокол on 07.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let tabBarController = UITabBarController()
        
        let startWindow = LaunchViewController()
        let startWindowNavigationController = UINavigationController(rootViewController: startWindow)
        //tabBarController.viewControllers = [startWindowNavigationController]
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = startWindowNavigationController
        window?.makeKeyAndVisible()
    
        return true
    }
    
    
}
