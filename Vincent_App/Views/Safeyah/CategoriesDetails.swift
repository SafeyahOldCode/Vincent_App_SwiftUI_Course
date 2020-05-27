//
//  CategoriesDetails.swift
//  Vincent_App
//
//  Created by Safeyah on 5/22/20.
//  Copyright © 2020 Safeyah Coding. All rights reserved.
//

class CartEnv: ObservableObject {
    @Published var totalprice = 0.0
    @Published var selectedItems: [Item] = []
}

import SwiftUI

struct CategoriesDetails: View {
    @State var CategoriesName : String = "Painting"
    @State var itemsOfCategory : [Item] = [
        Item(name: "", owner: "", price: 0, imageUrl: "",  exist: true)
    ]
        
    var body: some View {
        
        ZStack{
            
            Color.init("Color")
                .edgesIgnoringSafeArea(.all)
                .navigationBarItems(trailing: cartIcon())
            
            VStack(spacing: 20){
                    
                Spacer()

                headTitle(textline: "Choose what ever you like?")
                    

                ScrollView(.horizontal)
                {
                    
                    HStack(spacing: 40){
                        ForEach(itemsOfCategory, id: \.self) { ( it : Item ) in
                            
                            itemCard(item: it)
                        }
                }.onAppear(perform: getListOfItems )
                    
                }.padding()
                
                
                Spacer()
                
                
            }
            
        }
        
        
    }
    
    func getListOfItems()
    {
        Networking.getListOf(COLLECTION_NAME: CategoriesName) { (items: [Item] ) in
            self.itemsOfCategory = items
            print("\(self.itemsOfCategory)")
            
        }
    }
}


struct itemCard: View {
    var item : Item
    @EnvironmentObject var env : CartEnv

    var body: some View {
        ZStack{
            VStack{
                
                Text(item.name)
                    .font(.custom("SignPainter", size: 50))
                    .fontWeight(.semibold)
                
                Text(item.owner)
                    .font(.custom("SignPainter", size: 25 ))
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                
              Image("Old man")
                    .resizable()
                    .frame(width: 250, height: 200, alignment: .center)
                    .cornerRadius(15)
                
                
                Text("\(item.price, specifier: "%.1f")")
                    .font(.custom("SignPainter", size: 40))
                    .fontWeight(.bold)
                    .padding(.bottom)
                
                Button(action: {
                    //Add the item to the shopping list
                    //make the item unavaliable in database
                    self.env.selectedItems.append(self.item)
                    self.env.totalprice += self.item.price
                   
                    
                }) {
                    Text("Buy")
                        .font(.custom("SignPainter", size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(width: 150, height: 60)
                        .background(Color.init("Color"))
                        .clipShape(Capsule())
                }
            }
            
            
        }.frame(width: 340, height: 430)
            .background(Color.white)
            .clipShape(Roundedd())
            .padding()
    }
}

struct cartIcon: View {
    var body: some View {
        
        NavigationLink(destination: reviewcard() )
        {
            
            Image(systemName: "cart")
                       .font(.system(size: 25))
                       .foregroundColor(.black)
        }
        

      
    }
}

struct CategoriesDetails_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesDetails()
        .environmentObject(CartEnv())
        
    }
}
