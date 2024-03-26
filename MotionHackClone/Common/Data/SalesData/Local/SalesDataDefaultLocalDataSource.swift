//
//  SalesDataDefaultLocalDataSource.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 25/03/24.
//

import Foundation
import SwiftUI
import CoreData
import Combine

final class SalesDataDefaultLocalDataSouce: SalesDataLocalDataSource {
    
    private let container: NSPersistentContainer
    
    init(persistenStorage : NSPersistentContainer = PersistenceController.shared.container) {
        self.container = persistenStorage
    }
    
    func saveLocalSalesDataDS(by salesData: SalesDataModel) throws {
        let entity = SalesData(context: container.viewContext)
        
        entity.nama_barang = salesData.name
        entity.tanggal_input = salesData.date
        entity.total_penjualan = salesData.totalSales ?? 0
        entity.total_kuantitas = salesData.totalQuantity
        
        if container.viewContext.hasChanges {
            try container.viewContext.save()
        }
    }
    
    func loadLocalSalesDataDS() async throws -> [SalesData] {
        return try await withCheckedThrowingContinuation({ continuation in
            do {
                let fetchData = try container.viewContext.fetch(SalesData.fetchRequest())
                
                continuation.resume(returning: fetchData)
            } catch {
                continuation.resume(throwing: error)
            }
        })
    }
    
    func deleteLocalSalesDataDS() throws {
        Task.init(operation: {
            let item = try await loadLocalSalesDataDS()
            
            for i in item {
                container.viewContext.delete(i)
            }
        })
        
        if container.viewContext.hasChanges {
            try container.viewContext.save()
        }
    }
    
    func sumTotalSales(by salesData: [SalesData]) throws -> Double {
        var totalSales: Double = 0
        for sale in salesData {
            totalSales += sale.total_penjualan
        }
        return totalSales
    }
    
    func getSalesDataListModel() async throws -> [SalesDataModel] {
        return try await withCheckedThrowingContinuation({ continuation in
            do {
                let dataEntity = try container.viewContext.fetch(SalesData.fetchRequest())
                var data: [SalesDataModel] = []
                for i in dataEntity {
                    data.append(
                        SalesDataModel(
                            name: i.nama_barang,
                            date: i.tanggal_input!,
                            totalSales: i.total_penjualan,
                            totalQuantity: i.total_kuantitas!)
                    )
                }
                continuation.resume(returning: data)
            } catch {
                continuation.resume(throwing: error)
            }
        })
    }
}
