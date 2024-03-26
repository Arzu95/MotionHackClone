//
//  OTPViewModel.swift
//  MotionHackClone
//
//  Created by Rakha Fatih Athallah on 24/03/24.
//

import Foundation
import SwiftUI
import Combine



class OTPViewModel: ObservableObject {
    
    let numberOfFields: Int

    
    @Published var enterValue: [String]
    @Published var oldValue: String = ""
   
    //timer
    @Published var timerSubscription: AnyCancellable?
    @Published var seconds: Int
    @Published var moveToNextView = false
    
    init(numberOfFields: Int) {
        self.numberOfFields = numberOfFields
        self.enterValue = Array(repeating: "", count: numberOfFields)
        self.seconds = 0
    }
    
    // Timer Done
    // Timer digunakan untuk OTP Success screen agar bisa otomatis lanjut ke view selanjutya
    func startTimer(duration: Int) {
        self.seconds = duration
        timerSubscription = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            .sink { _ in
                if  self.seconds > 0 {
                    self.seconds -= 1
                    self.moveToNextView = false
                } else {
                    self.timerSubscription?.cancel()
                    self.moveToNextView = true
                }
            }
    }
}
