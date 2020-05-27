//
//  Rounded.swift
//  Vincent_App
//
//  Created by Safeyah on 5/27/20.
//  Copyright © 2020 Safeyah Coding. All rights reserved.
//

import Foundation
import SwiftUI

struct Roundedd : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight,.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 35, height: 30))
        return Path(path.cgPath)
    }
}
