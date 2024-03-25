//
//  InputSalesDataView.swift
//  MotionHackClone
//
//  Created by Yazid Al Ghozali on 25/03/24.
//

import SwiftUI

struct InputSalesDataView: View {
    
    @StateObject var viewModel = SalesDataViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color.black.opacity(viewModel.showDatePicker ? 0.25 : 0.00)
                    .ignoresSafeArea()
                
                VStack {
                    VStack(alignment: .leading) {
                        Text("Nama Deskripsi")
                            .bold()
                        TextField("Masukan nama pendataan penjualan", text: $viewModel.fieldNameDesc)
                            .frame(height: 42)
                            .padding(.horizontal, 12)

                            .overlay(
                                RoundedRectangle(cornerRadius: 13)
                                    .stroke(Color.gray)
                            )
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Pilih Tanggal")
                            .bold()
                        HStack {
                            TextField("Masukan tanggal pendataan penjualan", text: $viewModel.fieldDate)
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
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Total Penjualan")
                            .bold()
                        TextField("Masukan total penjualan", text: $viewModel.fieldTotalSales)
                            .frame(height: 42)
                            .padding(.horizontal, 12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 13)
                                    .stroke(Color.gray)
                            )
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Total Kuantitas")
                            .bold()
                        TextField("Masukan total kuantitas", text: $viewModel.fieldTotalQuantity)
                            .frame(height: 42)
                            .padding(.horizontal, 12)
                            .overlay(
                                RoundedRectangle(cornerRadius: 13)
                                    .stroke(Color.gray)
                            )
                    }
                    
                    Spacer()
                    ButtonPrimary(title: "Kirim", action: {
                        Task {
                            await viewModel.saveLocalSalesData()
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    })
                }
                .padding(.horizontal, 30)
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.automatic)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Input pendataan penjualan")
                            .foregroundColor(LocalColor.blue)
                            .fontWeight(.semibold)
                    }
                }
                
                if viewModel.showDatePicker == true {
                    DatePickerView($viewModel.selectionDate, $viewModel.showDatePicker)
                }
            }
        }
    }
}

extension InputSalesDataView {
    
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
                    viewModel.saveDate()
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

struct InputSalesDataView_Previews: PreviewProvider {
    static var previews: some View {
        InputSalesDataView()
    }
}
