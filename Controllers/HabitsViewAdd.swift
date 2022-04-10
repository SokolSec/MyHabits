//
//  HabitsViewAdd.swift
//  MyHabits
//
//  Created by Даниил Сокол on 10.04.2022.
//

import UIKit

final class HabitsViewAdd: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "НАЗВАНИЕ"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(pressTextField), for: .editingChanged)
        textField.layer.borderColor = UIColor.black.cgColor
        textField.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        textField.textColor = .black
        textField.placeholder = "Бегать по утрам, спать 8 часов и т.п."
        return textField
    }()
    
    private let colorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ЦВЕТ"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let colorButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .orange
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(tapToColor), for: .touchUpInside)
        return button
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "ВРЕМЯ"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 13)
        return label
    }()
    
    private let everyDayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Каждый день в "
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 17)
        return label
    }()
    
    private let datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.preferredDatePickerStyle = .wheels
        return datePicker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setNavigationBar()
        layout()
    }
    
    private func setNavigationBar() {
        title = "Создать"
        setBarButtons()
    }
    
    private func setBarButtons() {
        
        let barSaveButton = UIBarButtonItem(title: "Сохранить", style: .done, target: self, action: #selector(saveHabbit))
        barSaveButton.tintColor = #colorLiteral(red: 0.631372549, green: 0.0862745098, blue: 0.8, alpha: 1)
        self.navigationItem.rightBarButtonItem = barSaveButton
        
        let barCancelButton = UIBarButtonItem(title: "Отменить", style: .done, target: self, action: #selector(cancelHabbit))
        barCancelButton.tintColor = #colorLiteral(red: 0.631372549, green: 0.0862745098, blue: 0.8, alpha: 1)
        self.navigationItem.leftBarButtonItem = barCancelButton
    }
    
    @objc private func tapToColor() {
        
        let colorPicker = UIColorPickerViewController()
        colorPicker.delegate = self
        present(colorPicker, animated: true)
    }
    
    @objc private func saveHabbit() {
        
    }
    
    @objc private func pressTextField() {
        
    }
    
    @objc private func cancelHabbit() {
        dismiss(animated: true, completion: nil)
    }
    
    private func layout() {
        [nameLabel, textField, colorLabel, timeLabel, colorButton, everyDayLabel, datePicker].forEach({ view.addSubview($0) })
        
        NSLayoutConstraint.activate([
            
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 21),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            textField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 7),
            textField.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            
            colorLabel.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 15),
            colorLabel.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            
            colorButton.topAnchor.constraint(equalTo: colorLabel.bottomAnchor, constant: 7),
            colorButton.leadingAnchor.constraint(equalTo: colorLabel.leadingAnchor),
            colorButton.widthAnchor.constraint(equalToConstant: 30),
            colorButton.heightAnchor.constraint(equalToConstant: 30),
            
            timeLabel.topAnchor.constraint(equalTo: colorButton.bottomAnchor, constant: 15),
            timeLabel.leadingAnchor.constraint(equalTo: colorButton.leadingAnchor),
            
            everyDayLabel.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 7),
            everyDayLabel.leadingAnchor.constraint(equalTo: timeLabel.leadingAnchor),
            
            datePicker.topAnchor.constraint(equalTo: everyDayLabel.bottomAnchor, constant: 15),
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

extension HabitsViewAdd: UIColorPickerViewControllerDelegate {
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        self.colorButton.backgroundColor = color
    }
}
