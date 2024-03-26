//
//  AuthRepository.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 26/03/24.
//

import Foundation
import FirebaseAuth

protocol AuthRepository {
    func signUp(with email: String, password: String, completion: @escaping (Error?) -> Void)
    func login(with email: String, password: String, completion: @escaping (Error?) -> Void)
}
