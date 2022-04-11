//
//  LaunchScreen.swift
//  MyHabits
//
//  Created by Даниил Сокол on 07.04.2022.
//

import UIKit


final class LaunchScreen: UIViewController {
    
    var timer = Timer()
    
    private let logo: UIImageView = {
        let logo = UIImageView()
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "LaunchScreen")
        logo.layer.cornerRadius = 20
        logo.clipsToBounds = true
        return logo
    }()
    
    private let textLaunchScreen: UILabel = {
        let textLaunchScreen = UILabel()
        textLaunchScreen.translatesAutoresizingMaskIntoConstraints = false
        let rgbaTextLaunchScreen = UIColor(red: 161/255, green: 22/255, blue: 204/255, alpha: 1.0)
        textLaunchScreen.textColor = rgbaTextLaunchScreen
        textLaunchScreen.text = "MyHabits"
        textLaunchScreen.font = UIFont.systemFont(ofSize: 23, weight: .medium)
        textLaunchScreen.clipsToBounds = true
        return textLaunchScreen
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(logo)
        view.addSubview(textLaunchScreen)
        self.tabBarController?.tabBar.isHidden = true
        constantsLogo()
        constantsText()
        startTimer()
    }
    
    func constantsLogo() {
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            logo.widthAnchor.constraint(equalToConstant: 115),
            logo.heightAnchor.constraint(equalToConstant: 115)
        ])
    }
    
    func constantsText() {
        NSLayoutConstraint.activate([
            textLaunchScreen.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            textLaunchScreen.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(openHabitsTabBar), userInfo: nil, repeats: false)
    }
    
    @objc func openHabitsTabBar() {
        let twoWindows = HabitsTabBar()
        twoWindows.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(twoWindows, animated: true)
    }
}

