//
//  Validator.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 24/03/24.
//

import SwiftUI


struct ValidationPreferenceKey : PreferenceKey {
    // this default value can be anything as long as it also conforms equatable.
    static var defaultValue: [Bool] = []
    
    // reduction function that defines what should this key do on multiple iterations of the key registered.
    static func reduce(value: inout [Bool], nextValue: () -> [Bool]) {
      value += nextValue()
   }
}
