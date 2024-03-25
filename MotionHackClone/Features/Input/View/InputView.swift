//
//  InputView.swift
//  MotionHackClone
//
//  Created by Rakha Fatih Athallah on 25/03/24.
//

import SwiftUI

struct InputView: View {
    var body: some View {
        
        NavigationView {
            VStack(spacing: 25) {
                salesRecording()
                inventoryRecording()
                Spacer()
            }.padding(.top, 50)
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView()
    }
}

extension InputView {
    
    @ViewBuilder
    func salesRecording() -> some View {
        NavigationLink {
            EmptyView()
        } label: {
            RoundedRectangle(cornerRadius: 14)
                .stroke(LocalColor.blue, lineWidth: 1)
                .foregroundColor(.white)
                .frame(width: 329, height: 193)
                .overlay {
                    HStack {
                        LocalImage.penjualan
                            .resizable()
                            .scaledToFill()
                            .frame(width: 159, height: 159)
                        Text("Pendapatan \nPenjualan")
                            .foregroundColor(LocalColor.darkGray)
                            .fontModifier(type: FontType.bold, size: 16, weight: .bold)
                    }
                }
        }
    }
    @ViewBuilder
    func inventoryRecording() -> some View {
        NavigationLink {
            InventoryRecordingView()
        } label: {
            
            RoundedRectangle(cornerRadius: 14)
                .stroke(LocalColor.blue, lineWidth: 1)
                .foregroundColor(.white)
                .frame(width: 329, height: 193)
                .overlay {
                    HStack {
                        LocalImage.inventaris
                            .resizable()
                            .scaledToFill()
                            .frame(width: 159, height: 159)
                        Text("Pendapatan \nInventaris")
                            .foregroundColor(LocalColor.darkGray)
                            .fontModifier(type: FontType.bold, size: 16, weight: .bold)
                    }
                }
        }
    }
}
