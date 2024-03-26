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
    @Published var fieldSearch: String = ""
    @Published var selectionDate: Date = Date()
    @Published var showDatePicker: Bool = false
    @Published var salesListData = [SalesData]()
    @Published var salesDataModel: [SalesDataModel] = []
    @Published var error = ""
    
    var searchItem: [SalesDataModel] {
        if fieldSearch.isEmpty {
            return salesDataModel.compactMap({ $0 })
        } else {
            return salesDataModel.filter { item in
                (item.date?.formatted() ?? "").contains(fieldSearch) ||
                (item.date?.formatted() ?? "").contains(fieldSearch)
            }
        }
    }
    
    var totalAmount: String {
        return Currency().toRupiah("\(totalSalesData())")
    }
    
    private let repository : SalesDataRepository
    
    init(repository: SalesDataRepository = SalesDataDefaultRepo()) {
        self.repository = repository
    }
    
    func getListSalesFromModel() async {
        do {
            let data = try await repository.getListDataSalesModel()
            DispatchQueue.main.sync { [weak self] in
                self?.salesDataModel.append(contentsOf: data)
            }
        } catch {
            DispatchQueue.main.sync {
                self.error = "\(error)"
            }
        }
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
        return total
    }
    
    func saveDate(_ field: inout String) -> String {
        field = selectionDate.formatted()
        return field
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
