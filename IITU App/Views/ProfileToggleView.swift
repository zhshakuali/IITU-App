//
//  ProfileToggleView.swift
//  IITU App
//
//  Created by Жансая Шакуали on 30.03.2024.
//

import UIKit

protocol ProfileToggleViewDelegate: AnyObject {
    func profileToggleViewDidTapAboutMe(_ toggleView: ProfileToggleView)
    func profileToggleViewDidTapSchedule(_ toggleView: ProfileToggleView)
    func profileToggleViewDidTapEditingProfile(_ toggleView: ProfileToggleView)
}


class ProfileToggleView: UIView {

    enum State {
        case aboutMe
        case schedule
        case editingProfile
    }
    
    var state: State = .aboutMe
    
    weak var delegate: ProfileToggleViewDelegate?
    
    private let aboutMeButton: UIButton = {
        let button = UIButton()
        button.setTitle("About me", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let scheduleButton: UIButton = {
        let button = UIButton()
        button.setTitle("Schedule", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let editingProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Edit Pofile", for: .normal)
        button.setTitleColor(.label, for: .normal)
        return button
    }()
    
    private let indicatorView: UIView = {
        let indicatorView = UIView()
        indicatorView.backgroundColor = .red
        indicatorView.layer.cornerRadius = 4
        indicatorView.layer.masksToBounds = true
        return indicatorView
    }()


    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(aboutMeButton)
        addSubview(scheduleButton)
        addSubview(editingProfileButton)
        addSubview(indicatorView)
        aboutMeButton.addTarget(self, action: #selector(didTapAboutMe), for: .touchUpInside)
        scheduleButton.addTarget(self, action: #selector(didTapSchedule), for: .touchUpInside)
        editingProfileButton.addTarget(self, action: #selector(didTapEditingProfile), for: .touchUpInside)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        aboutMeButton.frame = CGRect(x: 35, y: 0, width: 100, height: 40)
        scheduleButton.frame = CGRect(x: aboutMeButton.right, y: 0, width: 100, height: 40)
        editingProfileButton.frame = CGRect(x: scheduleButton.right, y: 0, width: 100, height: 40)
        layoutIndicator()
    }
    
    @objc private func didTapAboutMe() {
        state = .aboutMe
        UIView.animate(withDuration: 0.2) {
            self.layoutIndicator()
        }
        delegate?.profileToggleViewDidTapAboutMe(self)
    }

    @objc private func didTapSchedule() {
        state = .schedule
        UIView.animate(withDuration: 0.2) {
            self.layoutIndicator()
        }
        delegate?.profileToggleViewDidTapSchedule(self)
    }
    
    @objc private func didTapEditingProfile() {
        state = .editingProfile
        UIView.animate(withDuration: 0.2) {
            self.layoutIndicator()
        }
        delegate?.profileToggleViewDidTapEditingProfile(self)
    }
    
    func layoutIndicator() {
        switch state {
        case .aboutMe:
            indicatorView.frame = CGRect(x: 35, y: aboutMeButton.bottom, width: 100, height: 4)
        case .schedule:
            indicatorView.frame = CGRect(x: aboutMeButton.right, y: aboutMeButton.bottom, width: 100, height: 4)
        case .editingProfile:
            indicatorView.frame = CGRect(x: scheduleButton.right, y: aboutMeButton.bottom, width: 100, height: 4)
        }
    }
    
    func update(for state: State) {
        self.state = state
        UIView.animate(withDuration: 0.1) {
            self.layoutIndicator()
        }
    }
}
