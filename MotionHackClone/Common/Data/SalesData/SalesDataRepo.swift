//
//  SalesDataRepo.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 25/03/24.
//

import Foundation

protocol SalesDataRepository {
    func saveLocalSalesData(by salesData: SalesDataModel) throws
    func loadLocalSalesData() async throws -> [SalesData]
    func deleteLocalSalesData() throws
    func sumTotalSalesData(by salesData: [SalesData]) throws -> Double
}
