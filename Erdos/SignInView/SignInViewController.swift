//
//  ViewController.swift
//  Erdos
//
//  Created by Eric Barnes on 2/17/23.
//

import UIKit
// TODO: simulate loading

class SignInViewController: UIViewController {

    // MARK: UI Components
    lazy private var logoImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "sun.min.fill")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    lazy private var usernameTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Email or username"
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    lazy private var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Password"
        tf.isSecureTextEntry = true
        tf.font = UIFont.systemFont(ofSize: 20)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    lazy private var usernameLineView: UIView = {
        let v = UIView()
        v.backgroundColor = .lightGray
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    lazy private var passwordLineView: UIView = {
        let v = UIView()
        v.backgroundColor = .lightGray
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    lazy private var signInButton: UIButton = {
        let butt = UIButton()
        butt.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        butt.setTitle("Sign In", for: .normal)
        butt.backgroundColor = #colorLiteral(red: 0.03468338773, green: 0.5188688636, blue: 0.9972413182, alpha: 1)
        butt.layer.cornerRadius = 10
        butt.translatesAutoresizingMaskIntoConstraints = false
        return butt
    }()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
    }
    
    // MARK: Helper Methods
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(logoImageView)
        view.addSubview(usernameTextField)
        view.addSubview(usernameLineView)
        view.addSubview(passwordTextField)
        view.addSubview(passwordLineView)
        view.addSubview(signInButton)
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -150),
            logoImageView.widthAnchor.constraint(equalToConstant: 50),
            logoImageView.heightAnchor.constraint(equalToConstant: 50),
            
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            usernameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            
            usernameLineView.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 5),
            usernameLineView.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor),
            usernameLineView.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            usernameLineView.heightAnchor.constraint(equalToConstant: 0.5),
            
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: usernameLineView.bottomAnchor, constant: 20),
            passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            
            passwordLineView.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5),
            passwordLineView.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            passwordLineView.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            passwordLineView.heightAnchor.constraint(equalTo: usernameLineView.heightAnchor),
            
            signInButton.topAnchor.constraint(equalTo: passwordLineView.bottomAnchor, constant: 50),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: passwordLineView.widthAnchor, multiplier: 1),
        ])
    }

    @objc func signInButtonTapped(_ sender: UIButton) {
        let homeVC = ContactListViewController()
        
        navigationController?.pushViewController(homeVC, animated: false)
    }

}

