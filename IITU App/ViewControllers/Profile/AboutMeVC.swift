//
//  AboutMeVC.swift
//  IITU App
//
//  Created by Жансая Шакуали on 30.03.2024.
//

import UIKit

class AboutMeVC: UIViewController {
    
    private let headerLabel: UILabel = {
       let label = UILabel()
        label.text = "User Information"
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(headerLabel)
        setConstraints()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            headerLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            headerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            headerLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    


}
