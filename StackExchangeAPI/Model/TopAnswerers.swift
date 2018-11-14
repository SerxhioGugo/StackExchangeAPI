//
//  TopAnswerers.swift
//  StackExchangeAPI
//
//  Created by Serxhio Gugo on 10/17/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import Foundation

struct JSONResponse: Codable {
    let items: [Items]?
}

struct Items: Codable {
    let user: User?
    let postCount: Int?
    let score: Int?
    
    private enum CodingKeys: String, CodingKey {
        case user, score
        case postCount = "post_count"
    }
}

struct User: Codable {
    let reputation: Int?
    let userType: String?
    let profileImage: String?
    let name: String?
    let link: String?
    
    private enum CodingKeys: String, CodingKey {
        case reputation, link
        case userType = "user_type"
        case profileImage = "profile_image"
        case name = "display_name"
        
    }
}
