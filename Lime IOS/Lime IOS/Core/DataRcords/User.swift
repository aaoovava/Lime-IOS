//
//  User.swift
//  Lime IOS
//
//  Created by Wasiliy Lolita on 11.07.2024.
//

import Foundation

final class User {
    private var _name: String
    private var _date: String
    private var _phone: String
    private var _password: String
    private var _error: String = ""
    
    private init(name : String, date: String, phone: String, password: String, error: String) {
        self._name = name
        self._date = date
        self._phone = phone
        self._password = password
        self._error = error
    }
    
    static func createUser(name: String, date: String, phone: String, password: String, repass: String) -> User {
        if (name != "" && date != "" && phone != "" && password != "" && repass != "") {
            if validatePhoneNumber(phone) {
                if password.count >= 6 {
                    if password == repass {
                        return User(name: name, date: date, phone: phone, password: password, error: "")
                    } else {
                        return User(name: name, date: date, phone: phone, password: password, error: "Паролі не співпадають")
                    }
                } else {
                    return User(name: name, date: date, phone: phone, password: password, error: "Пароль повинен містити не менше 6 символів")
                }
            } else {
                return User(name: name, date: date, phone: phone, password: password, error: "Неправильний номер телефону")
            }
        } else {
            return User(name: name, date: date, phone: phone, password: password, error: "Заповніть всі поля")
        }
    }
    
    static func validatePhoneNumber(_ phoneNumber: String) -> Bool {
            let phoneRegex = "^(\\+380|0)\\d{9}$"
            let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return phoneTest.evaluate(with: phoneNumber)
        }
        
        
        var phone: String {
            get {
                return _phone
            }
            set {
                _phone = newValue
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
        
        var error: String {
            get {
                return _error
            }
        }
    }
