import Foundation
import Firebase

final class User {
    private var _name: String
    private var _date: String
    private var _phone: String
    private var _password: String
    private var _error: String = ""
    private var _abonimentEndDate: String
    private var _abonimentStartDate: String
    private var _abonimentStatus: String
    private var _afreezeDate: String
    private var _afreezeDays: String
    private var _age: String
    private var _countOfGT: String
    private var _gfreezeDate: String
    private var _gfreezeDays: String
    private var _groupTEndDate: String
    private var _groupTStartDate: String
    private var _groupTStatus: String
    private var _image: String
    private var _userBuys: [String: UserBuy]
    
    private init(name: String, date: String, phone: String, password: String, error: String, abonimentEndDate: String, abonimentStartDate: String, abonimentStatus: String, afreezeDate: String, afreezeDays: String, age: String, countOfGT: String, gfreezeDate: String, gfreezeDays: String, groupTEndDate: String, groupTStartDate: String, groupTStatus: String, image: String, userBuys: [String: UserBuy]) {
        self._name = name
        self._date = date
        self._phone = phone
        self._password = password
        self._error = error
        self._abonimentEndDate = abonimentEndDate
        self._abonimentStartDate = abonimentStartDate
        self._abonimentStatus = abonimentStatus
        self._afreezeDate = afreezeDate
        self._afreezeDays = afreezeDays
        self._age = age
        self._countOfGT = countOfGT
        self._gfreezeDate = gfreezeDate
        self._gfreezeDays = gfreezeDays
        self._groupTEndDate = groupTEndDate
        self._groupTStartDate = groupTStartDate
        self._groupTStatus = groupTStatus
        self._image = image
        self._userBuys = userBuys
    }
    
    static func createUser(name: String, date: String, phone: String, password: String, repass: String) -> User {
        let defaultDate = "--.--.----"
        let defaultStatus = "3"

        func createUserWithError(_ error: String) -> User {
            return User(
                name: name,
                date: date,
                phone: phone,
                password: password,
                error: error,
                abonimentEndDate: defaultDate,
                abonimentStartDate: defaultDate,
                abonimentStatus: defaultStatus,
                afreezeDate: defaultDate,
                afreezeDays: "0",
                age: "",
                countOfGT: "0",
                gfreezeDate: defaultDate,
                gfreezeDays: "0",
                groupTEndDate: defaultDate,
                groupTStartDate: defaultDate,
                groupTStatus: defaultStatus,
                image: "",
                userBuys: [:]
            )
        }

        guard !name.isEmpty, !date.isEmpty, !phone.isEmpty, !password.isEmpty, !repass.isEmpty else {
            return createUserWithError("Заповніть всі поля")
        }

        guard validatePhoneNumber(phone) else {
            return createUserWithError("Неправильний номер телефону")
        }

        guard password.count >= 6 else {
            return createUserWithError("Пароль повинен містити не менше 6 символів")
        }

        guard password == repass else {
            return createUserWithError("Паролі не співпадають")
        }

        return User(
            name: name,
            date: date,
            phone: phone,
            password: password,
            error: "",
            abonimentEndDate: defaultDate,
            abonimentStartDate: defaultDate,
            abonimentStatus: defaultStatus,
            afreezeDate: defaultDate,
            afreezeDays: "0",
            age: "",
            countOfGT: "0",
            gfreezeDate: defaultDate,
            gfreezeDays: "0",
            groupTEndDate: defaultDate,
            groupTStartDate: defaultDate,
            groupTStatus: defaultStatus,
            image: "",
            userBuys: [:]
        )
    }
    
    static func validatePhoneNumber(_ phoneNumber: String) -> Bool {
        let phoneRegex = "^(\\+380|0)\\d{9}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phoneNumber)
    }
    
    static func createUser(from snapshot: DataSnapshot) -> User? {
        guard
            let value = snapshot.value as? [String: Any],
            let name = value["name"] as? String,
            let date = value["age"] as? String,
            let phone = value["number"] as? String,
            let password = value["password"] as? String,
            let abonimentEndDate = value["aboniment_end_date"] as? String,
            let abonimentStartDate = value["aboniment_start_date"] as? String,
            let abonimentStatus = value["aboniment_status"] as? String,
            let afreezeDate = value["afreeze_date"] as? String,
            let afreezeDays = value["afreeze_days"] as? String,
            let age = value["age"] as? String,
            let countOfGT = value["countOfGT"] as? String,
            let gfreezeDate = value["gfreeze_date"] as? String,
            let gfreezeDays = value["gfreeze_days"] as? String,
            let groupTEndDate = value["group_t_end_date"] as? String,
            let groupTStartDate = value["group_t_start_date"] as? String,
            let groupTStatus = value["group_t_status"] as? String,
            let image = value["image"] as? String,
            let userBuysDict = value["user_buys"] as? [String: [String: String]]
        else {
            return nil
        }
        
        var userBuys: [String: UserBuy] = [:]
        
        for (key, value) in userBuysDict {
            if let cost = value["cost"], let date = value["date"], let nameOfBuy = value["name_of_buy"] {
                let userBuy = UserBuy(cost: cost, date: date, nameOfBuy: nameOfBuy)
                userBuys[key] = userBuy
            }
        }
        
        return User(
            name: name,
            date: date,
            phone: phone,
            password: password,
            error: "",
            abonimentEndDate: abonimentEndDate,
            abonimentStartDate: abonimentStartDate,
            abonimentStatus: abonimentStatus,
            afreezeDate: afreezeDate,
            afreezeDays: afreezeDays,
            age: age,
            countOfGT: countOfGT,
            gfreezeDate: gfreezeDate,
            gfreezeDays: gfreezeDays,
            groupTEndDate: groupTEndDate,
            groupTStartDate: groupTStartDate,
            groupTStatus: groupTStatus,
            image: image,
            userBuys: userBuys
        )
    }
    
    // Public getters for private variables
    var name: String {
        return _name
    }
    
    var date: String {
        return _date
    }
    
    var phone: String {
        return _phone
    }
    
    var password: String {
        return _password
    }
    
    var error: String {
        return _error
    }
    
    var abonimentEndDate: String {
        return _abonimentEndDate
    }
    
    var abonimentStartDate: String {
        return _abonimentStartDate
    }
    
    var abonimentStatus: String {
        return _abonimentStatus
    }
    
    var afreezeDate: String {
        return _afreezeDate
    }
    
    var afreezeDays: String {
        return _afreezeDays
    }
    
    var age: String {
        return _age
    }
    
    var countOfGT: String {
        return _countOfGT
    }
    
    var gfreezeDate: String {
        return _gfreezeDate
    }
    
    var gfreezeDays: String {
        return _gfreezeDays
    }
    
    var groupTEndDate: String {
        return _groupTEndDate
    }
    
    var groupTStartDate: String {
        return _groupTStartDate
    }
    
    var groupTStatus: String {
        return _groupTStatus
    }
    
    var image: String {
        return _image
    }
    
    var userBuys: [String: UserBuy] {
        return _userBuys
    }
}

struct UserBuy {
    let cost: String
    let date: String
    let nameOfBuy: String
}
