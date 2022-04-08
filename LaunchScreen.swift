//
//  LaunchScreen.swift
//  MyHabits
//
//  Created by Даниил Сокол on 07.04.2022.
//

import UIKit

class LaunchScreen: UIViewController {
    
    private let logo : UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "LaunchScreen")
        logo.layer.cornerRadius = 20
        logo.clipsToBounds = true
        logo.translatesAutoresizingMaskIntoConstraints = false
        return logo
    }()
    
    private let textLaunchScreen : UILabel = {
        let textLaunchScreen = UILabel()
        textLaunchScreen.text = "MyHabits"
        textLaunchScreen.textColor = .purple
        textLaunchScreen.clipsToBounds = true
        textLaunchScreen.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        textLaunchScreen.translatesAutoresizingMaskIntoConstraints = false
        return textLaunchScreen
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(logo)
        view.addSubview(textLaunchScreen)
        constantsLogo()
        constantsText()
    }
    
    func constantsLogo() {
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            logo.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            logo.widthAnchor.constraint(equalToConstant: 120),
            logo.heightAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    func constantsText() {
        NSLayoutConstraint.activate([
//            textLaunchScreen.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
//            textLaunchScreen.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            textLaunchScreen.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 40),
            textLaunchScreen.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: 40),
            textLaunchScreen.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
}
}
