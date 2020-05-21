//
//  Env.swift
//  projecttest
//
//  Created by sarah alshammari on 5/20/20.
//  Copyright © 2020 sarah alshammari. All rights reserved.
//

import Foundation
class Env : ObservableObject {
    
  //  @Published var total = 0
    @Published var itemm = item(name: "", price: 0,desc: "0", total: 0)
    @Published var product = [""]
    @Published var productprice = [0]
    
}
