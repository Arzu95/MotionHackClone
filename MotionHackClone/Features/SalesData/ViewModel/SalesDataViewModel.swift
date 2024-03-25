//
//  SalesDataViewModel.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 25/03/24.
//

import Foundation
import SwiftUI

final class SalesDataViewModel : ObservableObject {
    @Published var fieldNameDesc: String = ""
    @Published var fieldTotalQuantity: String = ""
    @Published var fieldTotalSales: String = ""
    @Published var fieldDate: String = ""
    @Published var selectionDate: Date = Date()
    @Published var showDatePicker: Bool = false
    @Published var salesListData = [SalesData]()
    @Published var error = ""
    
    private let repository : SalesDataRepository
    
    init(repository: SalesDataRepository = SalesDataDefaultRepo()) {
        self.repository = repository
    }
    
    func totalSalesData() -> Double {
        var total: Double = 0
        do {
            let dataSales = try repository.sumTotalSalesData(by: salesListData)
            total = dataSales
        } catch {
            DispatchQueue.main.sync {
                self.error = "\(error)"
            }
        }
        print(total)
        return total
    }
    
    func saveDate() -> String {
        fieldDate = selectionDate.formatted()
        return fieldDate
    }
    
    func loadLocalSalesData() async {
        do {
            let data = try await repository.loadLocalSalesData()
            
            DispatchQueue.main.async { [weak self] in
                self?.salesListData = data
            }
        } catch {
            DispatchQueue.main.async { [weak self] in
                self?.error = "\(error)"
            }
        }
    }
    
    func deleteLocalSalesData() async {
        do {
            try repository.deleteLocalSalesData()
        } catch {
            self.error = "\(error)"
        }
    }
    
    func validate() -> Bool {
        if !fieldDate.isEmpty && !fieldNameDesc.isEmpty && !fieldTotalSales.isEmpty && !fieldTotalQuantity.isEmpty {
            return true
        }
        return false
    }
    
    func saveLocalSalesData() async {
        let sales = SalesDataModel(
            name: fieldNameDesc,
            date: selectionDate,
            totalSales: Double(fieldTotalSales) ?? 0.0,
            totalQuantity: fieldTotalQuantity)
        
        do {
            if validate() {
                try repository.saveLocalSalesData(by: sales)
            }
        } catch {
            DispatchQueue.main.sync {
                self.error = "\(error)"
            }
        }
    }
}
