//
//  BusinessSearch.swift
//  City Sights App
//
//  Created by Warkois on 4/14/22.
//

import Foundation

struct BusinessSearch: Decodable {
    
    var businesses = [Business]()
    var total = 0
    var region = Region()
}

struct Region: Decodable{
    var center = Coordinate()
    
}
