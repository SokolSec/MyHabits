//
//  HabitsTabBar.swift
//  MyHabits
//
//  Created by Даниил Сокол on 08.04.2022.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    let habitsViewController = HabitsViewController()
    let infoViewController = InfoViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let habitsTabBar = UINavigationController(rootViewController: habitsViewController)
        habitsTabBar.tabBarItem.title = "Привычки"
        
        let infoTabBar = UINavigationController(rootViewController: infoViewController)
        infoTabBar.tabBarItem.title = "Информация"
        
        let appearance = UITabBarAppearance()
        
        self.navigationItem.setHidesBackButton(true, animated: false)
        
        self.setViewControllers([habitsTabBar, infoTabBar], animated: false)
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white
        
        tabBar.standardAppearance = appearance
        
        guard let items = self.tabBar.items else { return }
        
        let iconsTabBar = ["rectangle.grid.1x2.fill", "info.circle.fill"]
        
        for x in 0...1 {
            items[x].image = UIImage(systemName: iconsTabBar[x])
        }
        
        let colorIcons = UIColor(red: 161/255, green: 22/255, blue: 204/255, alpha: 1.0)
        
        self.tabBar.tintColor = colorIcons
    }
}
