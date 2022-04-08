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
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        let startWindow = SplashScreen()
        let _startWindow = UINavigationController(rootViewController: startWindow)
        
        tabBarController.viewControllers = [_startWindow]
        return true
    }
}
