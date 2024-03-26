//
//  Currency.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 26/03/24.
//

import Foundation

class Currency {
    func toRupiah(_ amountString: String) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.maximumFractionDigits = 2
        formatter.locale = Locale(identifier: "id_ID")
        
        if let amount = Double(amountString), amount > 0 {
            return formatter.string(from: NSNumber(value: amount)) ?? "0"
        } else {
            return "0"
        }
    }
}
