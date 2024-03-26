//
//  InventoryItemList.swift
//  MotionHackClone
//
//  Created by Rakha Fatih Athallah on 26/03/24.
//

import SwiftUI

struct InventoryItemList: View {
    let data: InventoryRecordingModel
    var body: some View {
            VStack {
                HStack(spacing: 20) {
                    Image(systemName: data.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                    VStack(alignment: .leading) {
                        Text(data.name)
                            .fontModifier(type: FontType.medium, size: 12, weight: .medium)
                        Text(data.type)
                            .foregroundColor(Color(.darkGray))
                            .fontModifier(type: FontType.regular, size: 12, weight: .regular)
                    }
                    Spacer()
                    Text("Tersedia: \(data.stock)")
                        .foregroundColor(Color(.darkGray))
                        .fontModifier(type: FontType.regular, size: 10, weight: .regular)
                }.padding(.horizontal, 50)
            }
            .padding(.vertical)
            .background {
                RoundedRectangle(cornerRadius: 9)
                    .foregroundColor(.white)
                    .frame(width: 330, height: 56.42)
            }
        }
    
}

struct InventoryItemList_Previews: PreviewProvider {
    static var previews: some View {
        InventoryItemList(data: InventoryRecordingModel(id: 1, image: "exclamationmark.triangle", name: "Keju", type: "Makanan", stock: 2, date: "20/1/2022"))
    }
}
