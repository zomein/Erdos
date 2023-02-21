//
//  ViewController.swift
//  Erdos
//
//  Created by Eric Barnes on 2/17/23.
//

import UIKit

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
    lazy private var failedSignInLabel: UILabel = {
       let l = UILabel()
        l.text = "Sign in attempt failed. Please try again"
        l.font = UIFont.systemFont(ofSize: 13)
        l.textColor = .red
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
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
    
    let viewModel = SignInViewModel()
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
        setupBinders()
    }
    
    // MARK: Helper Methods
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(logoImageView)
        view.addSubview(usernameTextField)
        view.addSubview(usernameLineView)
        view.addSubview(passwordTextField)
        view.addSubview(passwordLineView)
        view.addSubview(failedSignInLabel)
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
            
            failedSignInLabel.topAnchor.constraint(equalTo: passwordLineView.bottomAnchor, constant: 10),
            failedSignInLabel.leadingAnchor.constraint(equalTo: passwordLineView.leadingAnchor),
            
            signInButton.topAnchor.constraint(equalTo: failedSignInLabel.bottomAnchor, constant: 40),
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signInButton.widthAnchor.constraint(equalTo: passwordLineView.widthAnchor, multiplier: 1),
        ])
        
        failedSignInLabel.isHidden = true
    }

    private func setupBinders() {
        // subscribe to 'signInSuccessful' property
        viewModel.signInSuccessful.bind { [weak self] signInSuccessful in
            if signInSuccessful == true {
                self?.goToContactsPage()
            } else {
                self?.handleSignInFailed()
            }
        }
    }
    
    private func goToContactsPage() {
        failedSignInLabel.isHidden = true
        
        let homeVC = ContactListViewController()
        navigationController?.pushViewController(homeVC, animated: false)
    }
    
    private func handleSignInFailed() {
        // create label to show error message
        failedSignInLabel.isHidden = false
    }

    // MARK: Objc UI action handlers/selectors
    @objc func signInButtonTapped(_ sender: UIButton) {
        guard
            let email = usernameTextField.text,
            let password = passwordTextField.text,
            !email.isEmpty,
            !password.isEmpty
        else { return }
        
        viewModel.signIn(email: email, password: password)
    }
    
    
}

