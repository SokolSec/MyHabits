//
//  HabitProgressViewCell.swift
//  MyHabits
//
//  Created by Даниил Сокол on 11.04.2022.
//

import UIKit

final class ProgressViewCollectionCell: UICollectionViewCell {
    
    //MARK: - Public properties
    lazy var progressLabel: UILabel = {
        let progressLabel = UILabel()
        progressLabel.translatesAutoresizingMaskIntoConstraints = false
        progressLabel.text = "Все получится!"
        progressLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        progressLabel.backgroundColor = .white
        progressLabel.textColor = .systemGray2
        progressLabel.numberOfLines = 1
        return progressLabel
    }()
    
    lazy var percentLabel: UILabel = {
        let percentLabel = UILabel()
        percentLabel.translatesAutoresizingMaskIntoConstraints = false
        percentLabel.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        percentLabel.backgroundColor = .white
        percentLabel.textColor = .systemGray2
        percentLabel.numberOfLines = 1
        return percentLabel
    }()
    
    lazy var progressView: UIProgressView = {
        let progressBar = UIProgressView(progressViewStyle: .bar )
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.trackTintColor = .systemGray2
        progressBar.progressTintColor = UIColor(red: 0.63, green: 0.09, blue: 0.80, alpha: 1.00)
        progressBar.backgroundColor = .white
        progressBar.layer.cornerRadius = 5
        progressBar.clipsToBounds = true
        progressBar.layer.sublayers![1].cornerRadius = 3.5
        progressBar.subviews[1].clipsToBounds = true
        return progressBar
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 14
        contentView.addSubviews(progressLabel, percentLabel, progressView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initialProgress() {
        progressView.progress = HabitsStore.shared.todayProgress
        percentLabel.text = String(Int(HabitsStore.shared.todayProgress * 100)) + "%"
        initialLayout()
    }
    
    func initialLayout() {
        NSLayoutConstraint.activate([
            progressLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            progressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            percentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            percentLabel.leadingAnchor.constraint(equalTo: progressLabel.trailingAnchor, constant: 16),
            percentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            progressView.topAnchor.constraint(equalTo: progressLabel.bottomAnchor, constant: 8),
            progressView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            progressView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            progressView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            progressView.heightAnchor.constraint(equalToConstant: 7)
        ])
    }
}

public extension UIView {
    
    func toAutoLayout() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}
