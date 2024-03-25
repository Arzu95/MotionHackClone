//
//  SalesListLocalDataSource.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 25/03/24.
//

import Foundation
import CoreData

protocol SalesDataLocalDataSource {
    func saveLocalSalesDataDS(by salesData: SalesDataModel) throws
    func loadLocalSalesDataDS() async throws -> [SalesData]
    func deleteLocalSalesDataDS() throws
    func sumTotalSales(by salesData: [SalesData]) throws -> Double
}
