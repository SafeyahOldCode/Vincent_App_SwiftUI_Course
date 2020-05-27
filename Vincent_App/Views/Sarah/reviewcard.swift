//
//  reviewcard.swift
//  projecttest
//
//  Created by sarah alshammari on 5/20/20.
//  Copyright © 2020 sarah alshammari. All rights reserved.
//

import SwiftUI

struct reviewcard: View {
    
    @EnvironmentObject  var env : CartEnv

    var body: some View {
        ZStack{
            
            VStack{
                
                Text("YOUR ORDER")
                    .font(.custom("SignPainter", size: 50))
                    .offset(x:-80,y:0)
                
                
                List{
                    ForEach( self.env.selectedItems , id: \.self)
                    { (i:Item) in
                        
                        listeditem(it:i)
                        
                    }
                    
                }.frame(width: 420, height:500)
                
                
                VStack(spacing:10)
                {
                    HStack{
                        
                        Text("Your Total :")
                            .foregroundColor(.black)
                            .font(.custom("SignPainter", size: 30))
                        
                        Spacer()
                        
                        Text("\(env.totalprice)")
                            .foregroundColor(.black)
                            .font(.custom("SignPainter", size: 30))
                        
                    }.padding()
                    
                    
                    checkout()}
                
            }
            
        }
        
    }
    
    
}



struct listeditem: View {
    var it : Item
    
    var body: some View {
        VStack{
            
            HStack()
                {
                    HStack{
                        Image(self.it.imageUrl)
                            .resizable()
                            .frame(width: 80, height: 80)
                            .cornerRadius(15)
                        
                        Text(self.it.name)
                            //.font(.custom("SignPainter", size: 30))
                    }
                    
                    Spacer()
                    Text("\(self.it.price, specifier: "%.1f") KD")
                        .font(.custom("SignPainter", size: 30))
                    
            }
            
        }
    }
}


struct checkout: View {
    @EnvironmentObject  var env : CartEnv

    @State var buttonn = false
    @State var showing = false
    var body: some View {
        HStack{
            if self.env.totalprice > 0.0
            {
                NavigationLink(destination: Checkout())
                {
                   Text("Checkout")
                       .foregroundColor(.black)
                       .font(.custom("SignPainter", size: 40))
                       .frame(width: 180, height: 60)
                       .background(Color.init("Color"))
                       .clipShape(Capsule())
                  
                }
                
            }
                
            else{
                
                Button(action:
                    {
                        self.showing.toggle()
                        
                }){
                    Text("Checkout")
                        .foregroundColor(.black)
                        .font(.custom("SignPainter", size: 40))
                        .frame(width: 180, height: 60)
                        .background(Color.init("Color"))
                        .clipShape(Capsule())}
                        .alert(isPresented: $showing)
                        {
                            Alert(title: Text("Your cart is empty you have to order"),dismissButton: .default(Text("Ok")))
                    }
            
                
            }
            
            
            
            Button(action: {
                
                self.buttonn.toggle()
            })
            {
                NavigationLink(destination: _Categories() )
                {
                    if self.buttonn == true{
                        Text("ADD Items")
                            .foregroundColor(.black)
                            .font(.custom("SignPainter", size: 40))
                            .frame(width: 180, height: 60)
                            .overlay(Capsule().stroke(Color.init("Color"),lineWidth: 8))
                            .clipShape(Capsule())}
                    else{
                        Text("ADD Items")
                            .foregroundColor(.black)
                            .font(.custom("SignPainter", size: 40))
                            .frame(width: 180, height: 60)
                            .background(Color.init("Color"))
                            .clipShape(Capsule())
                    }
                    
                }}
        }
    }
}

struct reviewcard_Previews: PreviewProvider {
    static var previews: some View {
        reviewcard()
    }
}
