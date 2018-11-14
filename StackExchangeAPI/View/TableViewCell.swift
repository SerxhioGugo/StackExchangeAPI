//
//  TableViewCell.swift
//  StackExchangeAPI
//
//  Created by Serxhio Gugo on 10/16/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import UIKit
import SDWebImage

class TableViewCell: UITableViewCell {
    
    var dataSource: Any? {
        didSet {
            guard
                let item = dataSource as? Items,
                let user = item.user,
                let profileImage = user.profileImage,
                let profileImageURL = URL(string: profileImage)
                else { return }
            
            ImageService.downloadImage(withURL: profileImageURL) { (image) in
                self.profileImageView.image = image
            }
//            profileImageView.sd_setImage(with: profileImageURL)
            nameLabel.attributedText = getAttribute(with: "Name: ", titleValue: user.name?.capitalized ?? "Name not available")
            reputationLabel.attributedText = getAttribute(with: "Reputation: ", titleValue: "\(user.reputation ?? 0)")
            postCountLabel.attributedText = getAttribute(with: "Post Count: ", titleValue: "\(item.postCount ?? 0)")
            scoreLabel.attributedText = getAttribute(with: "Score: ", titleValue: "\(item.score ?? 0)")
            
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    private func getAttribute(with title: String, titleValue: String) -> NSMutableAttributedString {
        let attributedText = NSMutableAttributedString(string: title, attributes: [NSAttributedString.Key.font : UIFont(name: "Avenir-Medium", size: 17)!, NSAttributedString.Key.foregroundColor: UIColor.darkGray])
        attributedText.append(NSAttributedString(string: "\(titleValue)", attributes: [NSAttributedString.Key.font : UIFont(name: "Avenir-Heavy", size: 18)!]))
        
        return attributedText
    }
    
    let cellView: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.dropShadow()
        return view
    }()
    
    let profileImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = false
        img.layer.masksToBounds = true
        img.layer.cornerRadius = 5
        
        return img
    }()
    
    let nameLabel: UILabel = {
       let label = UILabel()
        label.backgroundColor = UIColor.myGrayColor
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    let reputationLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.myGrayColor
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    let postCountLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.myGrayColor
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.myGrayColor
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.numberOfLines = 1
        label.textAlignment = .center
        return label
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 10
        sv.distribution = .fillEqually
        
        return sv
    }()
    
    private func setupUI() {
        
        self.add(subview: cellView) { (v, p) in [
            v.leadingAnchor.constraint(equalTo: p.leadingAnchor, constant: 7.5),
            v.trailingAnchor.constraint(equalTo: p.trailingAnchor, constant: -7.5),
            v.topAnchor.constraint(equalTo: p.topAnchor, constant: 7.5),
            v.bottomAnchor.constraint(equalTo: p.bottomAnchor, constant: -7.5),
            ]}
        
        cellView.add(subview: profileImageView) { (v, p) in [
            v.leadingAnchor.constraint(equalTo: p.leadingAnchor, constant: 10),
            v.centerYAnchor.constraint(equalTo: p.centerYAnchor),
            v.heightAnchor.constraint(equalToConstant: 120),
            v.widthAnchor.constraint(equalToConstant: 120)
            ]}
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(reputationLabel)
        stackView.addArrangedSubview(postCountLabel)
        stackView.addArrangedSubview(scoreLabel)
        
        cellView.add(subview: stackView) { (v, p) in [
            v.leftAnchor.constraint(equalTo: profileImageView.rightAnchor, constant: 10),
            v.centerYAnchor.constraint(equalTo: p.centerYAnchor),
            v.heightAnchor.constraint(equalToConstant: 150),
            v.trailingAnchor.constraint(equalTo: p.trailingAnchor, constant: -10)
            ]}
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
