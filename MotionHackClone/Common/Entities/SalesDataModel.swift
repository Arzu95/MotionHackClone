//
//  SalesDataModel.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 25/03/24.
//

import Foundation

class SalesDataModel : Codable {
    let name: String?
    let date: Date?
    let totalSales: Int?
    let totalQuantity: String?
    
    init(name: String?, date: Date, totalSales: Int, totalQuantity: String) {
        self.name = name
        self.date = date
        self.totalSales = totalSales
        self.totalQuantity = totalQuantity
    }
}
