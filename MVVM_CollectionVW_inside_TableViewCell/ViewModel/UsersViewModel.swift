//
//  ViewModel.swift
//  Task_01
//
//  Created by Kishan Thakkar on 15/07/22.
//

import Foundation

class UsersViewModel : NSObject {
    
    private var apiService : APIService!
    private(set) var userData : UserResponse! {
        didSet {
            self.bindUsersViewModelToController()
        }
    }
    
    var bindUsersViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService =  APIService()
        callFuncToGetUserData()
    }
    
    func callFuncToGetUserData() {
        self.apiService.apiToGetUserData { (userData) in
            self.userData = userData
        }
    }
}
