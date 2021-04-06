//
//  Product_Structure.swift
//  ACTMobile_Test
//
//  Created by Sneh Kothari on 05/04/21.
//

import Foundation

struct Sale: Codable{
    var sales: [Product]
}
struct Product: Codable{
//    struct Country_Price: Codable{
//        var country: String
//        var price: Int
//    }
    var prod: String
    var country: String
    var price: Int

    //var countryPrice: [Country_Price]
}
