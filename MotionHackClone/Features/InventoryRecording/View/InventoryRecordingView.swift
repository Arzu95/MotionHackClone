//
//  InventoryRecordingView.swift
//  MotionHackClone
//
//  Created by Rakha Fatih Athallah on 25/03/24.
//

import SwiftUI

struct InventoryRecordingView: View {
    let data: [InventoryRecordingModel] = InventoryRecordingDummyData
    var body: some View {
        ZStack {
            LocalColor.baseColor
                .ignoresSafeArea(.all)
            RoundedRectangle(cornerRadius: 28.26)
                .fill(LocalColor.blue)
                .frame(width: UIScreen.main.bounds.width, height: 269)
                .frame(maxHeight: .infinity, alignment: .top)
                .ignoresSafeArea(.all)
            
            VStack {
                // header
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8.5)
                            .fill(LocalColor.darkBlue)
                            .frame(width: 330, height: 63)
                        HStack {
                            LocalImage.file
                                .resizable()
                                .foregroundColor(.white)
                                .scaledToFill()
                                .frame(width: 34, height: 33)
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Total Barang yang tersedia")
                                    .foregroundColor(.white)
                                    .fontModifier(type: FontType.medium, size: 10, weight: .medium)
                                Text("120 Barang")
                                    .foregroundColor(.white)
                                    .fontModifier(type: FontType.bold, size: 12, weight: .bold)
                            }
                            
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 40)
                    }
                    
                    NavigationLink {
                        
                    } label: {
                        Text("Input Inventaris")
                            .foregroundColor(LocalColor.blue)
                            .fontModifier(type: FontType.medium, size: 15, weight: .medium)
                            .background {
                                RoundedRectangle(cornerRadius: 12)
                                    .foregroundColor(.white)
                                    .frame(width: 329, height: 45.4)
                                
                            } .padding()
                    }
                    
                }.padding(.top, 60)
                
                HStack(spacing: 160) {
                    Text("Stok Barang")
                        .fontModifier(type: FontType.semibold, size: 12, weight: .semibold)
                    Text("Lihat Lainnya")
                        .fontModifier(type: FontType.semibold, size: 12, weight: .semibold)
                }.padding(.top, 50)
                //Item List
                ForEach(data) { item in
                    InventoryItemList(data: item)
                }
                
                Spacer()
            }
        }
    }
}

struct InventoryRecordingView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryRecordingView()
    }
}



