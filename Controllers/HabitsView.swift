//
//  HabitsView.swift
//  MyHabits
//
//  Created by Даниил Сокол on 08.04.2022.
//

import UIKit



class HabitsView: UIViewController, UITableViewDataSource{
    
    let posts = Post.publications()
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = UIColor.systemGray5
        tableView.separatorStyle = .none
        tableView.register(HabitsViewCell.self, forCellReuseIdentifier: String(describing: HabitsViewCell.self))
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        navigationController?.title = "asd"
        tableView.dataSource = self
        tableView.delegate = self
        constraintsTableView()
        view.backgroundColor = .systemGray5
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(changeLayout))
        title = "Привычки"
    }
    
    @objc func changeLayout() {
        let habitVC = HabitsViewAdd()
        let navContr = UINavigationController(rootViewController: habitVC)
        navContr.modalPresentationStyle = .fullScreen
        present(navContr, animated: true)
    }
    
    func constraintsTableView () {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 12),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -12),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HabitsViewCell.self), for: indexPath) as! HabitsViewCell
        cell.setupCell(publications: posts[indexPath.row])
        
        return cell
    }
}


extension HabitsView : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) ->
    CGFloat {
        160
    }
}
