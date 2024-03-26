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
    
    func signUpUser(email: String, password: String) async throws -> UserModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        return UserModel(user: authDataResult.user)
    }
    
    func signInUser(email: String, password: String) async throws -> UserModel {
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        return UserModel(user: authDataResult.user)
    }

    func getAuthenticatedUser() throws -> UserModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return UserModel(user: user)
    }
}
