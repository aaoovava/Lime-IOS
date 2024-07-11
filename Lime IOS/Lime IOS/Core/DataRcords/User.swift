//
//  User.swift
//  Lime IOS
//
//  Created by Wasiliy Lolita on 11.07.2024.
//

import Foundation

class User {
    private var _login: String
    private var _password: String
    
    init(login: String, password: String) {
        self._login = login
        self._password = password
    }
    
    var login: String {
        get {
            return _login
        }
        set {
            _login = newValue
        }
    }
    
    var password: String {
        get {
            return _password
        }
        set {
            _password = newValue
        }
    }
}
