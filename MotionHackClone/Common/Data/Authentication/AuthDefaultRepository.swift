//
//  AuthDefaultRepository.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 26/03/24.
//

import Foundation
import FirebaseAuth

final class AuthDefaultRepository : AuthRepository {
    
    private let authRepo : AuthRemoteDataSource
    
    init(authRepo: AuthRemoteDataSource = AuthDefaultRemoteDataSource()) {
        self.authRepo = authRepo
    }
    
    func signUp(with email: String, password: String, completion: @escaping (Error?) -> Void) {
        authRepo.createUser(with: email, password: password, completion: { _, error in
            completion(error)
        })
    }
    
    func login(with email: String, password: String, completion: @escaping (Error?) -> Void) {
        authRepo.signInUser(with: email, password: password, completion: { _, error in
            completion(error)
        })
    }
    
}
