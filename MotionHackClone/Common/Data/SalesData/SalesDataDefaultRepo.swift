//
//  SalesDataDefaultRepo.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 25/03/24.
//

import Foundation

final class SalesDataDefaultRepo : SalesDataRepository {
    
    private let salesDatalocal: SalesDataLocalDataSource
    
    init(salesDatalocal: SalesDataLocalDataSource = SalesDataDefaultLocalDataSouce()) {
        self.salesDatalocal = salesDatalocal
    }
    
    func loadLocalSalesData() async throws -> [SalesData] {
        try await self.salesDatalocal.loadLocalSalesDataDS()
    }
    
    func saveLocalSalesData(by salesData: SalesDataModel) throws {
        try self.salesDatalocal.saveLocalSalesDataDS(by: salesData)
    }
    
    func deleteLocalSalesData() throws {
        try self.salesDatalocal.deleteLocalSalesDataDS()
    }
}