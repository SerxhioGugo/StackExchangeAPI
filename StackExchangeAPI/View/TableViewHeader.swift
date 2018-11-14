//
//  TableViewHeader.swift
//  StackExchangeAPI
//
//  Created by Serxhio Gugo on 10/16/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import UIKit

class TableViewHeader: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        backgroundColor = .orange
    }
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Top Stack Exchange Answerers"
        label.textColor = .white
        label.font = UIFont(name: "Avenir-Medium", size: 18)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.backgroundColor = .orange
        return label
    }()
    
    private let profileImage: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = false
        img.layer.masksToBounds = true
        img.image = UIImage(named: "anonImage")
        img.backgroundColor = .clear
        
        return img
    }()
    
    private func setupUI(){
    
        add(subview: profileImage) { (v, p) in [
            v.leadingAnchor.constraint(equalTo: p.leadingAnchor, constant: 10),
            v.topAnchor.constraint(equalTo: p.topAnchor, constant: 10),
            v.bottomAnchor.constraint(equalTo: p.bottomAnchor, constant: -10),
            v.widthAnchor.constraint(equalTo: p.widthAnchor, multiplier: 0.1)
            ]}
        
        add(subview: headerLabel) { (v, p) in [
            v.leftAnchor.constraint(equalTo: profileImage.rightAnchor, constant: 10),
            v.topAnchor.constraint(equalTo: p.topAnchor, constant: 10),
            v.bottomAnchor.constraint(equalTo: p.bottomAnchor, constant: -10),
            v.widthAnchor.constraint(equalTo: p.widthAnchor)
            ]}
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
