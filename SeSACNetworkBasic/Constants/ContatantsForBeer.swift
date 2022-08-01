//
//  ContatantsForBeer.swift
//  SeSACNetworkBasic
//
//  Created by yongseok lee on 2022/08/01.
//

import Foundation


struct BeerJSONElements {
    
    private init() { }
    
    static let shared = BeerJSONElements()
    
    let name = "name"
    let ibu = "ibu"
    let description = "description"
    let imageURL = "image_url"
//    let firstHop = "ingredients"
    
}

enum ingredients: String {
    case hops
    case malt
}
