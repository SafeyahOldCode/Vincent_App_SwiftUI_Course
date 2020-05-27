//
//  Item.swift
//  FirebaseTemplate
//
//  Created by Omar Alibrahim on 5/9/20.
//  Copyright © 2020 OMAR. All rights reserved.
//

import Foundation


struct Item: Codable, Hashable{
    var name: String
    var owner : String
    var price: Double
    var imageUrl : String
    var exist : Bool
}
