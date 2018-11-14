//
//  Service.swift
//  StackExchangeAPI
//
//  Created by Serxhio Gugo on 10/17/18.
//  Copyright © 2018 Serxhio Gugo. All rights reserved.
//

import Foundation

class Service: NSObject {
    
    static let shared = Service()
    private let baseURL = "https://api.stackexchange.com/"
    
    func stackExchangeUsers(path: String, completion: @escaping (JSONResponse?, Error?) -> Void) {
        let urlString = "\(baseURL)\(path)"
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(nil, error)
                print("Error fetching users", error)
            }
            
            guard let response = response as? HTTPURLResponse, 200..<300 ~= response.statusCode else {
                completion(nil, error)
                print("Server bad response 404")
                return
            }
            
            guard let data = data else { return }
            do {
                let users = try JSONDecoder().decode(JSONResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(users, nil)
                }
                
                
            } catch let jsonErr {
                print("Failed to decode data", jsonErr)
            }
            
        }.resume()
    }
    
}
