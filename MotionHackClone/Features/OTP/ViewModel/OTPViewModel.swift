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
    
    init() {
        self.numberOfFields = 4
        self.enterValue = Array(repeating: "", count: numberOfFields)
        self.seconds = 0
    }
    
    // Timer Done
    // Timer digunakan untuk OTP Success screen agar bisa otomatis lanjut ke view selanjutya
    func startTimer(duration: Int, completion: @escaping (Bool) -> Void) {
        self.seconds = duration
        timerSubscription = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            .sink { _ in
                if  self.seconds > 0 {
                    self.seconds -= 1
                    completion(true)
                } else {
                    self.timerSubscription?.cancel()
                    completion(false)
                }
            }
    }
}
