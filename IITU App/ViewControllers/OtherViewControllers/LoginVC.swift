//
//  LoginVC.swift
//  IITU App
//
//  Created by Жансая Шакуали on 17.04.2024.
//

import UIKit

class LoginVC: UIViewController {
    
    let titleLabel = UILabel()
    let stackView = UIStackView()
    let imageView = UIImageView(image: UIImage(named: "logo"))
    let emailTextField = UITextField()
    let passwordTextField = UITextField()
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16)
        button.backgroundColor = .systemRed
        button.layer.cornerRadius = 8
        button.addTarget(LoginVC.self, action: #selector(handleLogIn), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let forgotbutton: UIButton = {
       let button = UIButton()
        button.setTitle("Forgot password?", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.backgroundColor = .systemBackground
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    @objc func handleLogIn() {
         validateForm()
       
     }
     
  
     
     func startLoggingIn(email: String, password: String) {
         
         if email == "Zhans" && password == "123456" {
             
           let controller = HomeVC()
             controller.navigationItem.title = email
             navigationController?.pushViewController(MainTabBarVC(), animated: true)
         } else {
             print("Please call any Sign up api for registration: ", email, password)
         }
        
         
     }
    
    func validateForm() {
        guard let emailText = emailTextField.text, !emailText.isEmpty else { return }
        guard let passwordText = passwordTextField.text, !passwordText.isEmpty else { return }
        
        startLoggingIn(email: emailText, password: passwordText)
        
    }
    
    @objc func handleTextChange() {
            
            let emailText = emailTextField.text!
            
            let passwordText = passwordTextField.text!
            
            let isFormFilled = !emailText.isEmpty && !passwordText.isEmpty
            
            if isFormFilled {
                loginButton.backgroundColor = UIColor.systemRed
                loginButton.isEnabled = true
            }else {
                loginButton.backgroundColor = UIColor.lightGray
                loginButton.isEnabled = false
            }
            
        }
    
}

extension LoginVC {
    func style() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Login"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        
        styleTextField(emailTextField, withText: "  Student ID")
        styleTextField(passwordTextField, withText: "  Password")
        
        
    }
    
    private func styleTextField(_ textField: UITextField, withText text: String) {
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .systemGray5
        textField.placeholder = text
        textField.layer.cornerRadius = 8
        textField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
    }
    
    func layout() {
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(loginButton)
        stackView.addArrangedSubview(forgotbutton)
        
        view.addSubview(imageView)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.widthAnchor.constraint(equalToConstant: 150),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            emailTextField.heightAnchor.constraint(equalToConstant: 44),
            
            passwordTextField.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            passwordTextField.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            loginButton.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
            
            forgotbutton.widthAnchor.constraint(equalTo: emailTextField.widthAnchor),
            forgotbutton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor)
        ])
    }
}

