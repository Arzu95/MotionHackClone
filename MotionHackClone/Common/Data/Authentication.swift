//
//  Authentication.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 25/03/24.
//

import Foundation
import Firebase

final class Authentication {
    static let shared = Authentication()
    private init() {}
    
    func signUpUser(email: String, password: String) async throws {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        let result = UserModel(user: authDataResult.user)
    }
    
}
