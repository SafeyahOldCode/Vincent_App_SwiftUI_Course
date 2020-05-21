//
//  itemsdetails.swift
//  projecttest
//
//  Created by sarah alshammari on 5/15/20.
//  Copyright © 2020 sarah alshammari. All rights reserved.
//

import Foundation
import SwiftUI
struct item: Hashable,Identifiable {
  var name : String
    var price : Int
    var desc : String
    var total = 0
     var id = UUID()
   
      
    func Createe(name : String,price : Int,desc:String) {
       
   
        items.append( item(name: name, price: price, desc: desc, total: 0))
       
       
      
    }


}
var item1 = item(name:"Fisherman",price: 5,desc: " Aziz alswaidan",total: 0)
var item2 = item(name: "Bottle", price: 6,desc: "Ahmed",total: 0)
var item3 = item(name: "Old man", price: 2,desc: "Mariam",total: 0)
var items = [item1,item2,item3]
