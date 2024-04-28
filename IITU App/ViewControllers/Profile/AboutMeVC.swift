//
//  AboutMeVC.swift
//  IITU App
//
//  Created by Жансая Шакуали on 30.03.2024.
//

import UIKit


import UIKit

class AboutMeVC: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    private var userInfoModels = [String]()
    private var creationTimeModels = [String]()
    private var sections = [String]()
    
    private let logOutButton: UIButton = {
       let button = UIButton()
        button.setTitle("Log Out", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .red
        button.layer.cornerRadius = 10
        button.addTarget(AboutMeVC.self, action: #selector(logOut), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        view.addSubview(logOutButton)
        tableView.delegate = self
        tableView.dataSource = self
        updateUI()
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    @objc func logOut() {
      
    }
    
    private func updateUI() {
        
        sections.append("User Information")
        sections.append("Creation Time")
        
        // Добавляем данные для первой секции
        userInfoModels.append("Name: Zhansaya Shakuali")
        userInfoModels.append("Email address: 29273@iitu.edu.kz")
        userInfoModels.append("Specialization: Information system")
        userInfoModels.append("Faculty: FDT")
        
        // Добавляем данные для второй секции
        creationTimeModels.append("First access to site: 7 September 2020")
        creationTimeModels.append("Last access to site: 22 November 2023")
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            logOutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            logOutButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120),
            logOutButton.widthAnchor.constraint(equalToConstant: 80),
            logOutButton.heightAnchor.constraint(equalToConstant: 35)
        ])
    }

}

extension AboutMeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Устанавливаем количество строк в зависимости от секции
        if section == 0 {
            return userInfoModels.count
        } else {
            return creationTimeModels.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if indexPath.section == 0 {
            // Заполняем ячейки данными из массива userInfoModels для первой секции
            cell.textLabel?.text = userInfoModels[indexPath.row]
        } else {
            // Заполняем ячейки данными из массива creationTimeModels для второй секции
            cell.textLabel?.text = creationTimeModels[indexPath.row]
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
}
