//
//  ValidatorModifier.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 24/03/24.
//

import SwiftUI

struct ValidationModifier : ViewModifier {
    
    // This variable gonna hold the logic we are gonna use for validation.
    let validation : () -> Bool
    
    
    func body(content: Content) -> some View {
        content
            .preference(
                key: ValidationPreferenceKey.self,
                value: [validation()]
            )
    }
}

// And this extension constrains this only for certain types of Views such as TextFields and SecureFields.
extension TextField {
    func validate(_ flag : @escaping () -> Bool) -> some View {
        self.modifier(ValidationModifier(validation: flag))
    }
}

extension SecureField {
    func validate(_ flag : @escaping () -> Bool) -> some View {
        self.modifier(ValidationModifier(validation: flag))
    }
}

struct TextFormView<Content : View> : View {
    @State var validationSeed : [Bool] = []
    @ViewBuilder var content : ((@escaping () -> Bool)) -> Content
    
    var body: some View {
        content(validate)
            .onPreferenceChange(ValidationPreferenceKey.self) { value in
                validationSeed = value
            }
    }
    
    private func validate() -> Bool {
        for seed in validationSeed {
            if !seed { return false }
        }
        return true
    }
}
