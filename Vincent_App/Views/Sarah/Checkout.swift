//
//  Checkout.swift
//  projecttest
//
//  Created by sarah alshammari on 5/25/20.
//  Copyright © 2020 sarah alshammari. All rights reserved.
//

import SwiftUI

struct Checkout: View {
    @State var adress = ["","","","",""]
    

    var body: some View {
        ZStack{
            
            VStack(spacing : 30)
            {
                Text("ADRESS:")
                   .font(.custom("SignPainter", size: 40))
                   .offset(x:-140,y: 0)
                
                VStack
                {
                        TextField("Area",text: $adress[0])
                        TextField("Block",text: $adress[1])
                        TextField("House No.",text: $adress[2])
                        TextField("Street",text: $adress[3])
                        TextField("Additional Direction",text: $adress[4])
                } .padding()
                    
                    
                HStack
                    {
                        Text("Pay With:")
                        .font(.custom("SignPainter", size: 40))
                           
                        Spacer()
                        
                        CheckView()
                            
                }
                
                paymentsummary()
                
               
            }.padding()
        }
        
    }
}


struct CheckView: View {
    @State var isChecked = false
    
    var body: some View {
        Button(action: {self.isChecked.toggle()}){
            HStack{
                Image(systemName: isChecked ? "checkmark.square" : "square")
                    .foregroundColor(Color.black)
                    .font(.system(size: 20))
                
                Image("dollar")
                    .renderingMode(.original)
                    .resizable()
                    .frame(width: 30, height: 30)
                
                Text("Cash")
                    .font(.custom("SignPainter", size: 30))
                    .foregroundColor(Color.black)
                
            }
            
        }
        
    }
    
}

struct paymentsummary: View {
    @EnvironmentObject  var env : CartEnv

    
    
    @State var showing = false
    @State var isChecked = false

    var body: some View {
        VStack(spacing: 20)
        {
            Text("PAYMENT SUMMARY")
                .font(.custom("SignPainter", size: 40))
                .offset(x:-70)
            
            HStack()
            {
                Text("Order Total :")
                    .font(.custom("SignPainter", size: 20))
                
                Spacer()
                
                Text("\(self.env.totalprice) KD")
                    .font(.custom("SignPainter", size: 20))
                
            }.padding()
            
            HStack
            {
                Text("Service Charge :")
                    .font(.custom("SignPainter", size: 20))
                Spacer()

                Text("2.00 KD")                    .font(.custom("SignPainter", size: 20))
            }.padding()
            
            HStack
            {
                Text("Subtotal :")                    .font(.custom("SignPainter", size: 20))
                
                Spacer()
                
                Text("\(self.env.totalprice + 2)KD")                    .font(.custom("SignPainter", size: 20))
            }.padding()
          
            Button(action:{
               
                self.showing.toggle()
            })
            {
                Text("Place Order")
                    .foregroundColor(.black)
                    .font(.custom("SignPainter", size: 40))
                    .frame(width: 180, height: 60)
                    .background(Color.init("Color"))
                    .clipShape(Capsule())
                    
                    .alert(isPresented: $showing){
           
                        Alert(title: Text("Order Confirmed"),message: Text("Your Total \(self.env.totalprice)KD Thankyou"),dismissButton: .default(Text("Ok")))
    
                    }
            
            }
           
            
           
            
        }
    }
}

struct Checkout_Previews: PreviewProvider {
    static var previews: some View {
        Checkout()
    }
}
