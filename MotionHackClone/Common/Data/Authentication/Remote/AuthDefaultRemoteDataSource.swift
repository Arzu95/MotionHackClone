//
//  AuthDefaultRemoteDataSource.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 26/03/24.
//

import Foundation
import FirebaseAuth

final class AuthDefaultRemoteDataSource : AuthRemoteDataSource {
    
    func createUser(with email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password, completion: completion)
    }
    
    func signInUser(with email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }

}
