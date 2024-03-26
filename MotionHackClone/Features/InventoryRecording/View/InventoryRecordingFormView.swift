//
//  InventoryRecordingFormView.swift
//  MotionHackClone
//
//  Created by Rakha Fatih Athallah on 26/03/24.
//

import SwiftUI

struct InventoryRecordingFormView: View {
    
    @State var namaBarang: String = ""
    @State var tanggalBarang: Date = Date()
    @State var barangTersedia: String = ""
    
    var body: some View {
        VStack() {
            VStack(alignment: .leading) {
                Text("Nama Barang")
                    .fontModifier(type: FontType.semibold, size: 12.20, weight: .semibold)
                TextField("Masukkan nama barang...", text: $namaBarang)
                    .font(.custom(FontType.regular, size: 12))
                    .padding(12)
                    .cornerRadius(13)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.lightGray), lineWidth: 1)
                    )
                Text("Pilih Tanggal Pembelian")
                    .fontModifier(type: FontType.semibold, size: 12.20, weight: .semibold)
                DatePicker("Pilih Tanggal Pembelian...", selection: $tanggalBarang, displayedComponents: .date)
                    .foregroundColor(Color(.lightGray))
                    .font(.custom(FontType.regular, size: 12))
                    .padding(12)
                    .cornerRadius(13)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.lightGray), lineWidth: 1)
                            .frame(height: 45)
                    )
                Text("Total Tersedia")
                    .fontModifier(type: FontType.semibold, size: 12.20, weight: .semibold)
                TextField("Masukkan total barang tersedia...", text: $barangTersedia)
                    .font(.custom(FontType.regular, size: 12))
                    .padding(12)
                    .cornerRadius(13)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.lightGray), lineWidth: 1)
                    )
            }
            .padding()
            .padding(.top, 60)
            Spacer()
            
            Button {
                // do something...
                print(tanggalBarang)
            } label:  {
                Text("Input Barang")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(LocalColor.blue)
                    .cornerRadius(12)
            }
            .padding(.horizontal, 25)
        }.padding()
    }
}

struct InventoryRecordingFormView_Previews: PreviewProvider {
    static var previews: some View {
        InventoryRecordingFormView()
    }
}
