//
//  ApiManager.swift
//  Task_01
//
//  Created by Kishan Thakkar on 15/07/22.
//

import Foundation

class APIService :  NSObject {
    
    private let sourcesURL = URL(string: Constants.USERLIST_URL)!
    
    func apiToGetUserData(completion : @escaping (UserResponse) -> ()){
        
        URLSession.shared.dataTask(with: sourcesURL) { (data, urlResponse, error) in
            if let data = data {
                
                let jsonDecoder = JSONDecoder()
                
                let userData = try! jsonDecoder.decode(UserResponse.self, from: data)
            
                    completion(userData)
            }
            
        }.resume()
    }
    
}
