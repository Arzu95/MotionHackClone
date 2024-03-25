//
//  SalesDatView.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 25/03/24.
//

import SwiftUI
import Charts

struct SalesDataView: View {
    
    var data: [SalesDataModel] = [
        .init(name: "Data", date: Date.now, totalSales: 12, totalQuantity: "90 Kg"),
    ]
    
    @StateObject var viewModel = SalesDataViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                LocalColor.secondaryWhite
                RoundedRectangle(cornerRadius: 28)
                    .frame(height: 269, alignment: .top)
                    .foregroundColor(LocalColor.blue)
                    .cornerRadius(28)
                    .ignoresSafeArea(.all)
                    
                VStack(alignment: .leading) {
                    Text("Pendataan Penjualan")
                        .fontWeight(.semibold)
                        .foregroundColor(Color.white)
                    HStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 159, height: 63)
                                .foregroundColor(LocalColor.darkBlue)
                                .background(LocalColor.darkBlue)
                                .cornerRadius(8)
                            HStack {
                                Image.icon_wallet
                                VStack(alignment: .leading) {
                                    Text("Total Penjualan")
                                        .font(.system(size: 10))
                                        .fontWeight(.medium)
                                        .foregroundColor(Color.white)
                                    Text("Rp. \(viewModel.totalSalesData())")
                                        .font(.system(size: 12))
                                        .bold()
                                        .foregroundColor(Color.white)
                                }
                            }
                        }
                        Spacer()
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 159, height: 63)
                                .foregroundColor(LocalColor.darkBlue)
                                .background(LocalColor.darkBlue)
                                .cornerRadius(8)
                            HStack {
                                Image.icon_output
                                VStack(alignment: .leading) {
                                    Text("Total Pengeluaran")
                                        .font(.system(size: 10))
                                        .fontWeight(.medium)
                                        .foregroundColor(Color.white)
                                    Text("Rp. 0")
                                        .font(.system(size: 12))
                                        .bold()
                                        .foregroundColor(Color.white)
                                }
                            }
                        }
                    }
                    .padding(.top, 15)
                    NavigationLink(destination: InputSalesDataView(), label: {
                        Text("Input Penjualan Hari Ini")
                            .frame(maxWidth: .infinity)
                            .frame(height: 45)
                            .foregroundColor(LocalColor.blue)
                            .font(.system(size: 15))
                            .fontWeight(.medium)
                            .background(Color.white)
                            .cornerRadius(12)
                            .padding(.top, 15)
                            .padding(.bottom, 60)
                    })
                    VStack(alignment: .leading) {
                        Text("Grafik Data Penjualan")
                            .fontWeight(.semibold)
                            .padding(.bottom, 15)
                        VStack(alignment: .leading) {
                            VStack {
                                Text("Minggu Ini")
                                    .font(.system(size: 12))
                                    .fontWeight(.medium)
                                Text("+32.3 (9%)")
                                    .font(.system(size: 10))
                                    .foregroundColor(LocalColor.blue)
                            }
                            Chart {
                                BarMark(
                                    x: .value("Data", data[0].name ?? ""),
                                    y: .value("Total Count", data[0].date!)
                                )
                            }
                            .frame(height: 200)
                        }
                        .padding(.bottom, 18)
                    }
                    VStack {
                        HStack {
                            Text("Riwayat Penjualan")
                                .foregroundColor(LocalColor.secondaryBlack)
                                .fontWeight(.semibold)
                                .font(.system(size: 12))
                            Spacer()
                            Text("Lihat Lainnya")
                                .foregroundColor(LocalColor.secondaryBlack)
                                .fontWeight(.semibold)
                                .font(.system(size: 12))
                        }
                    }
                    ForEach(viewModel.salesListData.prefix(3), id: \.self) { item in
                        ListHistorySales(item)
                    }
                    Spacer()
                }
                .padding(.horizontal, 30)
                .onAppear {
                    Task {
                        await viewModel.loadLocalSalesData()
                    }
                }
            }
        }
    }
}

extension SalesDataView {
    
    @ViewBuilder
    func ListHistorySales(_ salesData: SalesData) -> some View {
        HStack {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 8.55)
                    .frame(width: 32, height: 32)
                    .foregroundColor(LocalColor.greyBg)
                    .overlay {
                        Image.icon_phone
                            .resizable()
                            .frame(width: 17, height: 20.48)
                    }
            }
            VStack(alignment: .leading) {
                Text(salesData.nama_barang ?? "Error")
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .foregroundColor(LocalColor.secondaryBlack)
                Text(salesData.total_kuantitas ?? "Error")
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .foregroundColor(LocalColor.greyText)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(salesData.tanggal_input?.formatted() ?? "Error")
                    .font(.system(size: 10))
                    .fontWeight(.medium)
                Text("+Rp \(Int32(salesData.total_penjualan))")
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .foregroundColor(LocalColor.green)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 56)
        .background(Color.white)
        .cornerRadius(8.55)
    }
}

struct SalesDatView_Previews: PreviewProvider {
    static var previews: some View {
        SalesDataView()
    }
}
