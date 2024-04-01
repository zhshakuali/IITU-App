//
//  MainTabBarVC.swift
//  IITU App
//
//  Created by Жансая Шакуали on 27.03.2024.
//

import UIKit

class MainTabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UINavigationController(rootViewController: HomeVC())
        let vc2 = UINavigationController(rootViewController: CoursesVC())
        let vc3 = UINavigationController(rootViewController: ProfileVC())
        
        
        
        
        vc1.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 1)
        vc2.tabBarItem = UITabBarItem(title: "Courses", image: UIImage(systemName: "graduationcap"), tag: 1)
        vc3.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 1)
    

        vc1.navigationBar.prefersLargeTitles = true
        vc2.navigationBar.prefersLargeTitles = true
        vc3.navigationBar.prefersLargeTitles = true

        vc1.navigationItem.largeTitleDisplayMode = .always
        vc2.navigationItem.largeTitleDisplayMode = .always
        vc3.navigationItem.largeTitleDisplayMode = .always
        
        vc1.navigationBar.tintColor = .label
        vc2.navigationBar.tintColor = .label
        vc3.navigationBar.tintColor = .label
        
        vc1.title = "Home"
        vc2.title = "Courses"
        vc3.title = "Profile"
        
       setViewControllers([vc1, vc2, vc3], animated: false)
        
        UITabBar.appearance().tintColor = .red
        
    }


}
