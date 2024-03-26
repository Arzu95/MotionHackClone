//
//  SalesDataDetailView.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 26/03/24.
//

import SwiftUI

struct SalesDataDetailView: View {
    @StateObject var viewModel = SalesDataViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                
                Color.black.opacity(viewModel.showDatePicker ? 0.25 : 0.00)
                    .ignoresSafeArea()

                ScrollView {
                    LazyVStack {
                        Text("Input pendataan penjualan")
                            .foregroundColor(LocalColor.blue)
                            .fontWeight(.semibold)
                            .padding(.bottom, 13)
                        HStack {
                            TextField("Masukan tanggal pendataan penjualan", text: $viewModel.fieldSearch)
                            Button(action: {
                                viewModel.showDatePicker.toggle()
                            }, label: {
                                Image.icon_calendar
                                    .resizable()
                                    .frame(width: 16, height: 16)
                            })
                        }
                        .frame(height: 42)
                        .padding(.horizontal, 12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 13)
                                .stroke(Color.gray)
                        )
                        
                        ForEach(viewModel.searchItem) { item in
                            ListHistorySales(item)
                        }
                        
                        Spacer()
                    }
                    .padding()
                    .onAppear {
                        Task {
                            await viewModel.getListSalesFromModel()
                        }
                    }
                }
                
                if viewModel.showDatePicker == true {
                    DatePickerView($viewModel.selectionDate, $viewModel.showDatePicker)
                }
            }
        }
    }
}

extension SalesDataDetailView {
    
    @ViewBuilder
    func ListHistorySales(_ salesData: SalesDataModel) -> some View {
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
                Text(salesData.name ?? "Error")
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .foregroundColor(LocalColor.secondaryBlack)
                Text(salesData.totalQuantity ?? "Error")
                    .font(.system(size: 12))
                    .fontWeight(.medium)
                    .foregroundColor(LocalColor.greyText)
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text(salesData.date?.formatted() ?? "Error")
                    .font(.system(size: 10))
                    .fontWeight(.medium)
                Text("+Rp \(Double(salesData.totalSales ?? 0))")
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
    
    @ViewBuilder
    func DatePickerView(_ selectDate: Binding<Date>, _ showDatePick: Binding<Bool>) -> some View {
        VStack {
            Spacer()
            
            VStack {
                DatePicker("Pilih Tanggal", selection: selectDate, displayedComponents: [.date])
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden()
                    .cornerRadius(10)
                    .background(Color.white)
                Button(action: {
                    viewModel.saveDate(&viewModel.fieldSearch)
                    viewModel.showDatePicker.toggle()
                }, label: {
                    Text("Konfirmasi")
                        .frame(maxWidth: .infinity)
                        .frame(height: 45)
                        .foregroundColor(.white)
                        .background(LocalColor.blue)
                        .cornerRadius(12)
                })
                .padding()
            }
            .background(Color.white)
            
            Spacer()
            
        }
        .background(Color.black.opacity(0.1))
        .edgesIgnoringSafeArea(.all)
    }
}

struct SalesDataDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SalesDataDetailView()
    }
}
