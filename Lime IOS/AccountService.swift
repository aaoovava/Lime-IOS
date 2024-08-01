import Foundation
import FirebaseCore
import FirebaseAuth

class AccountService {
    static let shared = AccountService()
    private init() {}
    
    func signIn(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().signIn(withEmail: email + "@gmail.com", password: password) { authResult, error in
            if let error = error {
                print(error)
            } else if let authResult = authResult {
                print("success")
            }
        }
    }
    
    func signUp(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void) {
        Auth.auth().createUser(withEmail: email + "@gmail.com", password: password) { authResult, error in
            if let error = error {
                print(error)
            } else if let authResult = authResult {
                print("success")
            }
        }
    }
    
    func signOut(completion: @escaping (Result<Void, Error>) -> Void) {
        do {
            try Auth.auth().signOut()
            print("success")
        } catch {
            print(error)
        }
    }
}
