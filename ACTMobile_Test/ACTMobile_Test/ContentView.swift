//
//  ContentView.swift
//  ACTMobile_Test
//
//  Created by Sneh Kothari on 05/04/21.
//

import SwiftUI

struct ContentView: View {

    @State var products:[String:[String:Int]]? = nil
    @State var productSelected = ""
    @State var showAll = false
    @State var showText = " "
    @State var showAlert = false
    var body: some View {
        ZStack{
            LinearGradient(gradient : Gradient(colors: [.blue, .green]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            if products != nil{
                MainScreen(showAlert: $showAlert, productSelected: $productSelected, products: $products, showAll: $showAll, showText: $showText)
            }
            else{
                Text("No products to show")
            }
        }.onAppear{
            LoadData()
        }
    }
    func LoadData(){
        if let bundledata = Bundle.main.url(forResource: "input_ios", withExtension: "json"){
            if let data = try? Data(contentsOf: bundledata){
                if let decoded = try? JSONDecoder().decode(Sale.self, from: data){
                    var prods: [String:[String:Int]] = [:]
                    for allproducts in decoded.sales{
                        if prods[allproducts.prod] == nil{
                            prods[allproducts.prod] = [allproducts.country : allproducts.price]
                        }
                        else{
                            if prods[allproducts.prod]![allproducts.country] == nil{
                                prods[allproducts.prod]![allproducts.country] = allproducts.price
                            }
                            else{
                                prods[allproducts.prod]![allproducts.country]! += allproducts.price
                            }
                        }
                    }
                    print(prods)
                    products = prods
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
