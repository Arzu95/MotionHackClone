//
//  InventoryRecordingModel.swift
//  MotionHackClone
//
//  Created by Rakha Fatih Athallah on 25/03/24.
//

import SwiftUI

struct InventoryRecordingModel: Identifiable {
    let id: Int
    let image: String
    let name: String
    let type: String
    let stock: Int
    let date: String
}

let InventoryRecordingDummyData = [
    InventoryRecordingModel(id: 1, image: "exclamationmark.triangle", name: "Keju", type: "Makanan", stock: 2, date: "20/1/2022"),
    InventoryRecordingModel(id: 2, image: "exclamationmark.triangle", name: "Keju", type: "Makanan", stock: 2, date: "20/1/2022"),
    InventoryRecordingModel(id: 3, image: "exclamationmark.triangle", name: "Keju", type: "Makanan", stock: 2, date: "20/1/2022"),
    InventoryRecordingModel(id: 4, image: "exclamationmark.triangle", name: "Keju", type: "Makanan", stock: 2, date: "20/1/2022"),
    InventoryRecordingModel(id: 5, image: "exclamationmark.triangle", name: "Keju", type: "Makanan", stock: 2, date: "20/1/2022")
]
