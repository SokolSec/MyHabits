//
//  InfoViewController.swift
//  MyHabits
//
//  Created by Даниил Сокол on 08.04.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let textInfoHeading : UILabel = {
        let textInfoHeading = UILabel()
        textInfoHeading.translatesAutoresizingMaskIntoConstraints = false
        textInfoHeading.text = "Привычка за 21 день"
        textInfoHeading.font = UIFont.boldSystemFont(ofSize: 22)
        return textInfoHeading
    }()
    
    private let textInfoMain : UILabel = {
        let textInfoMain = UILabel()
        textInfoMain.translatesAutoresizingMaskIntoConstraints = false
        textInfoMain.text = "Прохождение этапов, за которые за 21 день вырабатывается привычка, подчиняется следующему алгоритму:\n\n1. Провести 1 день без обращения к старым привычкам, стараться вести себя так, как будто цель, загаданная в перспективу, находится на расстоянии шага.\n\n2. Выдержать 2 дня в прежнем состоянии самоконтроля.\n\n3. Отметить в дневнике первую неделю изменений и подвести первые итоги – что оказалось тяжело, что – легче, с чем ещё предстоит серьёзно бороться.\n\n4. Поздравить себя с прохождением первого серьезного порога в 21 день. За это время отказ от дурных наклонностей уже примет форму осознанного преодоления и человек сможет больше работать в сторону принятия положительных качеств.\n\n5. Держать планку 40 дней. Протекающий методику уже чувствует себя освободившимся от прошлого негатива и двигается в нужном направлении с хорошей динамикой.\n\n6. На 90 день соблюдения техники всё лишнего из «прошлой жизни» перестает напоминать о себе, и человек оглянувшись назад, осознаёт себя полностью обновившимся."
        textInfoMain.font = UIFont.systemFont(ofSize: 20)
        textInfoMain.numberOfLines = 50
        return textInfoMain
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //title = "Информация"
       // tabBarItem.title = "Информация"
        
        view.addSubview(scrollView)
        scrollView.addSubview(textInfoHeading)
        scrollView.addSubview(textInfoMain)
        constraintsTextInfo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .systemGray6
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
    }
    
    func constraintsTextInfo () {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
        
        NSLayoutConstraint.activate([
            textInfoHeading.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            textInfoHeading.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            textInfoHeading.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate([
            textInfoMain.topAnchor.constraint(equalTo: textInfoHeading.bottomAnchor, constant: 12),
            textInfoMain.leadingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            textInfoMain.trailingAnchor.constraint(equalTo: scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -12),
            textInfoMain.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20)
        ])
    }
}


