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
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        print("1")
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print("2")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("3")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("4")
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("5")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("6")
    }
    
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
