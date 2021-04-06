//
//  MainScreen.swift
//  ACTMobile_Test
//
//  Created by Sneh Kothari on 06/04/21.
//

import SwiftUI

struct MainScreen: View {
    @Binding var showAlert: Bool
    @Binding var productSelected: String
    @Binding var products: [String:[String:Int]]?
    @Binding var showAll: Bool
    @Binding var showText: String
    var body: some View {
        VStack{
            HStack{
                Spacer()
            Text(productSelected == "" ? "Select Product" : "Product: \(productSelected)")
            .font(.largeTitle)
            .padding()
            .padding(.top)
                Spacer()
            }
            .contentShape(Rectangle())
            .onTapGesture {
                withAnimation{
                    showAll.toggle()
                }
                //productSelected = ""
            }
            Divider()
            if showAll{
                ForEach((products?.keys.sorted(by: <))!, id: \.self){key in
                    Text("Product: \(key)")
                        .font(.title3)
                        .padding(2)
                        .onTapGesture {
                            productSelected = key
                            withAnimation{
                            showAll = false
                                showText = " "
                            }
                        }
                }

            }
            if showText != " "{
                Text("Max sales: \(showText)")
                    .font(.title)
                    .padding()
            }
            Spacer()
            Button(action: {
                if productSelected != ""{
                    let countryPrice = products![productSelected]?.max{
                        a,b in a.value < b.value
                    }
                    withAnimation{
                        showText = countryPrice!.key
                    }
                    print(countryPrice ?? "NONE")
                }
                else{
                    showAlert = true
                }
            }, label: {
                Text("Top country for product")
                    .padding()
                    .padding(.horizontal)
                    .foregroundColor(Color.white)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .padding()
            })
        }
        .alert(isPresented: $showAlert){
            Alert(title: Text("Invalid Operation"), message: Text("Select Product before searching for top country"), dismissButton: .default(Text("Cancel")))
            
        }
    }
}

//struct MainScreen_Previews: PreviewProvider {
//    static var previews: some View {
//        //MainScreen()
//    }
//}
