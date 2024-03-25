//
//  UserModel.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 25/03/24.
//

import Foundation
import FirebaseAuth

struct UserModel {
    let uid: String
    let email: String?
    let pictUrl: String?
    let username: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.pictUrl = user.photoURL?.absoluteString
        self.username = user.displayName
    }
}
