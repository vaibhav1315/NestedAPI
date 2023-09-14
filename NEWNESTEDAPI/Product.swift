//
//  Product.swift
//  NEWNESTEDAPI
//
//  Created by Mac on 04/09/23.
//

import Foundation

struct APIResponse {
    var products : [Product]
    var total : Int
    var skip : Int
    var limit : Int
    
}

struct Product {
    var id : Int
    var title : String
    var description : String
    var price : Double
    var discountPercentage : Double
    var rating : Double
    var stock : Int
    var brand : String
    var category : String
    var thumbnail : String
    var images : [String]
}

