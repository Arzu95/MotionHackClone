//
//  SignUpViewModel.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 24/03/24.
//

import Foundation

class SignUpViewModel : ObservableObject {
    @Published var fieldNama: String = ""
    @Published var fieldEmail: String = ""
    @Published var fieldPasssword: String = ""
    @Published var fieldConfirmPassword: String = ""
    @Published var isVisiblePassword: Bool = true
    @Published var isVisibleConfirm: Bool = true
    
    var confirmPassword: Bool = false
    
    func samePassword() -> Bool {
        if fieldPasssword != fieldConfirmPassword {
            confirmPassword = true
            return confirmPassword
        }
        return confirmPassword
    }
}
