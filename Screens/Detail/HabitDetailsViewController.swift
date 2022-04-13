//
//  HabitDetailsViewController.swift
//  MyHabits
//
//  Created by Даниил Сокол on 11.04.2022.
//

import UIKit

class HabitDetailsViewController: UIViewController {
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.refreshControl = UIRefreshControl()
        tableView.isScrollEnabled = true
        tableView.separatorInset = .zero
        tableView.rowHeight = 44
        tableView.refreshControl?.addTarget(self, action: #selector(updateTable), for: .valueChanged)
        return tableView
    }()
    
    let habit: Habit
    static var isDeleted = false
    
    init(_ habit: Habit) {
        self.habit = habit
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Править", style: .plain, target: self, action: #selector(editTap))
        
        view.backgroundColor = .white
        view.addSubviews(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(HabitTableCell.self, forCellReuseIdentifier: "habitViewCell")
        tableView.register(HabitTableHeader.self, forHeaderFooterViewReuseIdentifier: "habitHeaderCell")
        
        initialLayout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        title = habit.name
    }
    
    func initialLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc func editTap() {
        self.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(HabitViewController(habit), animated: true)
    }
    
    @objc func updateTable() {
        tableView.reloadData()
        tableView.refreshControl?.endRefreshing()
    }
}

extension HabitDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HabitsStore.shared.dates.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell =  tableView.dequeueReusableCell(withIdentifier: "habitViewCell", for: indexPath) as? HabitTableCell else { return UITableViewCell() }
        let date = HabitsStore.shared.dates[indexPath.row]
        cell.initialEdit(date: date, check: HabitsStore.shared.habit(habit, isTrackedIn: date))
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "habitHeaderCell") as? HabitTableHeader else { return nil }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
    
}
