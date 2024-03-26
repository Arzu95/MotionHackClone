//
//  AuthRemoteDataSource.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 26/03/24.
//

import Foundation
import FirebaseAuth

protocol AuthRemoteDataSource {
    func createUser(with email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void)
    func signInUser(with email: String, password: String, completion: @escaping (AuthDataResult?, Error?) -> Void)
}
