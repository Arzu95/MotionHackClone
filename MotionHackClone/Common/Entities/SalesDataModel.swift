//
//  SalesDataModel.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 25/03/24.
//

import Foundation

class SalesDataModel : Codable, Identifiable {
    var id = UUID()
    let name: String?
    let date: Date?
    let totalSales: Double?
    let totalQuantity: String?
    
    init(name: String?, date: Date, totalSales: Double, totalQuantity: String) {
        self.name = name
        self.date = date
        self.totalSales = totalSales
        self.totalQuantity = totalQuantity
    }
}
