//
//  DesignTableView.swift
//  MyHabits
//
//  Created by Даниил Сокол on 09.04.2022.
//

import UIKit

class HabitsViewCell: UITableViewCell {
    
    private let newView : UIView = {
        let newView = UIView()
        newView.translatesAutoresizingMaskIntoConstraints = false
        newView.backgroundColor = .white
        return newView
    }()
    
    private let nameOfTheHabit : UILabel = {
        let nameOfTheHabit = UILabel()
        nameOfTheHabit.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        nameOfTheHabit.translatesAutoresizingMaskIntoConstraints = false
        return nameOfTheHabit
    }()
    
    
    private let atWhatTime : UILabel = {
        let description = UILabel()
        description.font = UIFont.systemFont(ofSize: 14)
        description.textColor = .systemGray
        description.numberOfLines = 10
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    private let counter : UILabel = {
        let counter = UILabel()
        counter.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        counter.translatesAutoresizingMaskIntoConstraints = false
        return counter
    }()
    
    private let checkNoActive : UIButton = {
       let checkActive = UIButton()
        checkActive.translatesAutoresizingMaskIntoConstraints = false
        let config = UIImage.SymbolConfiguration(
        pointSize: 45, weight: .ultraLight, scale: .default)
        let image = UIImage(systemName: "circle", withConfiguration: config)
        checkActive.setImage(image, for: .normal)
        checkActive.addTarget(self, action: #selector(active_), for: .touchUpInside)
        return checkActive
    }()
    
    @objc func active_ () {
        let config = UIImage.SymbolConfiguration(
            pointSize: 45, weight: .ultraLight, scale: .default)
        let image = UIImage(systemName: "checkmark.circle", withConfiguration: config)
        checkNoActive.setImage(image, for: .normal)
        checkNoActive.addTarget(self, action: #selector(active_), for: .touchUpInside)
        }
    
    override init (style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        customCell()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customCell() {
        contentView.backgroundColor = .systemGray5
        newView.layer.cornerRadius = 10
    }
    
    private func layout() {
        contentView.addSubview(newView)
        contentView.addSubview(nameOfTheHabit)
        contentView.addSubview(atWhatTime)
        contentView.addSubview(counter)
        contentView.addSubview(checkNoActive)
        
        NSLayoutConstraint.activate([
            newView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1),
            newView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 1),
            newView.bottomAnchor.constraint(equalTo: contentView.topAnchor, constant: -1),
            newView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1),
            newView.heightAnchor.constraint(equalToConstant: 160),
            
            nameOfTheHabit.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 30),
            nameOfTheHabit.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 25),
            
            atWhatTime.topAnchor.constraint(equalTo: nameOfTheHabit.safeAreaLayoutGuide.topAnchor, constant: 30),
            atWhatTime.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 25),
            
            counter.topAnchor.constraint(equalTo: atWhatTime.safeAreaLayoutGuide.bottomAnchor, constant: 50),
            counter.leftAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leftAnchor, constant: 25),
            
            checkNoActive.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 60),
            checkNoActive.rightAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.rightAnchor, constant: -25)
        ])
    }
    
    func setupCell(publications: Post) {
        nameOfTheHabit.text = publications.nameOfTheHabit
        atWhatTime.text = publications.atWhatTime
        counter.text = publications.counter
    }
}
