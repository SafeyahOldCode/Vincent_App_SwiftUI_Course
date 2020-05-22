//
//  CategoriesDetails.swift
//  Vincent_App
//
//  Created by Safeyah on 5/22/20.
//  Copyright © 2020 Safeyah Coding. All rights reserved.
//

import SwiftUI

struct CategoriesDetails: View {
    @State var CategoriesName : String = "Painting"
    @State var itemsOfCategory : [Item] = [Item(name: "Frishman", price: 60.9)]
    var body: some View {
        
        ZStack{
            
            VStack{
                Image(systemName: "cart")
                    .font(.system(size: 40))
                    .foregroundColor(.black)
                    .offset(x: 140, y:  0)
                    .padding()
                
                
                ScrollView(.horizontal)
                {
                    HStack{
                        ForEach(itemsOfCategory, id: \.self) { (item: Item) in
                            
                            ZStack{
                                VStack{
                                    Text(item.name)
                                        .font(.custom("SignPainter", size: 50))
                                        .fontWeight(.semibold)
                                    Text(item.name)
                                        .font(.custom("SignPainter", size: 25 ))
                                        .fontWeight(.semibold)
                                      .foregroundColor(.gray)
                                    
                                }
                                
                                
                            }.padding()
                        }
                    }
                   // .onAppear(perform: getListOfItems )
                    
                }.padding()
                
            }
            
            
            
            
        }
        
    }
    func getListOfItems()
    {
        Networking.getListOf(COLLECTION_NAME: CategoriesName) { (items: [Item] ) in
            self.itemsOfCategory = items
        }
    }
}




struct CategoriesDetails_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesDetails()
    }
}
