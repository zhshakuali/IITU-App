//
//  ProfileVC.swift
//  IITU App
//
//  Created by Жансая Шакуали on 30.03.2024.
//

import UIKit

class ProfileVC: UIViewController {
    
    private let aboutmeVC = AboutMeVC()
    private let scheduleVC = ScheduleVC()
    private let editProfileVC = EditProfileVC()
    
    private let toggleView = ProfileToggleView()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        return scrollView
    }()
    
    private let headerView: UIView = {
      let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let profileImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "zhansImage")
        image.backgroundColor = .white
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(scrollView)
        view.addSubview(toggleView)
        toggleView.delegate = self
        scrollView.delegate = self
        scrollView.contentSize = CGSize(width: view.frame.size.width * 3, height: scrollView.frame.size.height)
        setHeaderView()
        addChildren()
    }
    
    private func setHeaderView() {
        view.addSubview(headerView)
        headerView.addSubview(profileImage)
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        headerView.frame = CGRect(x: 0, y: 0, width: Int(view.frame.width), height: Int(view.frame.width/1.5))
        let imageSize: CGFloat = headerView.frame.height/2
        profileImage.frame =  CGRect(x: imageSize, y: imageSize/2, width: imageSize, height: imageSize)
        
        profileImage.layer.cornerRadius = imageSize/2
        
        toggleView.frame = CGRect(x: 0, y: headerView.bottom, width: view.frame.size.width, height: 55)
        
        scrollView.frame = CGRect(
            x: 0,
            y: toggleView.bottom,
            width: view.frame.size.width,
            height: view.frame.size.height - view.safeAreaInsets.top - view.safeAreaInsets.bottom - 55)
        
    }
    
    private func addChildren() {
        addChild(aboutmeVC)
        scrollView.addSubview(aboutmeVC.view)
        aboutmeVC.view.frame = CGRect(x: 0, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height - view.safeAreaInsets.bottom)
        aboutmeVC.didMove(toParent: self)
        
        addChild(scheduleVC)
        scrollView.addSubview(scheduleVC.view)
        scheduleVC.view.frame = CGRect(x: view.frame.size.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
        scheduleVC.didMove(toParent: self)
        
        addChild(editProfileVC)
        scrollView.addSubview(editProfileVC.view)
        editProfileVC.view.frame = CGRect(x: view.frame.size.width + view.frame.size.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
        editProfileVC.didMove(toParent: self)
        
    }

}

extension ProfileVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let viewWidth = view.frame.width
        let contentOffsetX = scrollView.contentOffset.x
        
        if contentOffsetX >= (viewWidth - 100) {
            toggleView.update(for: .schedule)
        } else if contentOffsetX >= (viewWidth * 2 - 200) {
            toggleView.update(for: .editingProfile)
        } else {
            toggleView.update(for: .aboutMe)
        }
    }

}

extension ProfileVC: ProfileToggleViewDelegate {
    func profileToggleViewDidTapAboutMe(_ toggleView: ProfileToggleView) {
        scrollView.setContentOffset(.zero, animated: true)
    }
    
    func profileToggleViewDidTapSchedule(_ toggleView: ProfileToggleView) {
        scrollView.setContentOffset(CGPoint(x: view.frame.size.width, y: 0), animated: true)
    }
    
    func profileToggleViewDidTapEditingProfile(_ toggleView: ProfileToggleView) {
        scrollView.setContentOffset(CGPoint(x: view.frame.size.width * 2, y: 0), animated: true)
    }
    
    
}
