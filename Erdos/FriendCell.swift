//
//  FriendCell.swift
//  Erdos
//
//  Created by Eric Barnes on 2/19/23.
//

import UIKit

class FriendCell: UITableViewCell {
    static let identifier = String(describing: FriendCell.self)
    
    lazy var containerView: UIView = {
        let v = UIView()
        v.backgroundColor = .secondarySystemBackground
        v.layer.cornerRadius = 10
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    lazy private var nameLabel: UILabel = {
        let l = UILabel()
        l.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        l.text = "Name:"
        l.font = UIFont.systemFont(ofSize: 17, weight: .light)
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    lazy private var emailLabel: UILabel = {
        let l = UILabel()
        l.textColor = #colorLiteral(red: 0.5808190107, green: 0.0884276256, blue: 0.3186392188, alpha: 1)
        l.font = UIFont.systemFont(ofSize: 17, weight: .light)
        l.text = "Email:"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    lazy private var nameString: UILabel = {
        let l = UILabel()
        l.textColor = .label
        l.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        l.text = "Bob Smith"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    lazy private var emailString: UILabel = {
        let l = UILabel()
        l.textColor = .label
        l.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        l.text = "abc@gmail.com"
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    func configure(friend: Friend) {
        nameLabel.text = friend.name
        emailString.text = friend.email
        
        setupUI()
    }
    
    // TODO: add spacing for cells
    
    private func setupUI() {
        addSubview(containerView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(emailLabel)
        containerView.addSubview(nameString)
        containerView.addSubview(emailString)
        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            containerView.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.8),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5),
            
            nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5),
            nameLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5),

            nameString.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 5),
            nameString.topAnchor.constraint(equalTo: nameLabel.topAnchor),

            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 10),
            emailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),

            emailString.leadingAnchor.constraint(equalTo: emailLabel.trailingAnchor, constant: 5),
            emailString.topAnchor.constraint(equalTo: emailLabel.topAnchor),
        ])
    }
}
