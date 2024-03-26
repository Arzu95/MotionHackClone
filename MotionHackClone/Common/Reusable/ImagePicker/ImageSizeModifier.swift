//
//  ImageSizeModifier.swift
//  MotionHackClone
//
//  Created by Rakha Fatih Athallah on 25/03/24.
//

import SwiftUI


// menghandle size dari image setelah dicapture..
extension Image {
    func imageSizeMod() -> some View {
        self
            .resizable()
    }
}
