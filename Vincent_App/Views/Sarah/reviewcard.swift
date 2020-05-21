//
//  reviewcard.swift
//  projecttest
//
//  Created by sarah alshammari on 5/20/20.
//  Copyright © 2020 sarah alshammari. All rights reserved.
//

import SwiftUI

struct reviewcard: View {
    var it : item
    @State var total: Int
    var body: some View {
        ZStack{
            Color.init("Color")
                .edgesIgnoringSafeArea(.all)
            GeometryReader{ geo in
                ScrollView{
                    VStack(spacing:20){
                        VStack{
                            Color.white
                        }
                        
                        Text("YOUR ORDER")
                            .font(.custom("SignPainter", size: 40))
                            .offset(y:-50)
                        
                        ForEach(items  , id: \.self){ i in
                            listeditem(it:i
                                
                                
                            )}.offset(y:-50)
                        Text("Your Total : \(self.total) KD")
                            .frame(width:139,height: 50).background(Color.init("Color")).cornerRadius(15).offset(x:80).font(.custom("SignPainter", size: 20))
                        
                        Text("Place Order")
                            .frame(width:200,height: 50).background(Color.init("Color")).cornerRadius(15).offset(x:80).font(.custom("SignPainter", size: 30)).offset(y:-10)
                        
                    } .frame(width: 350, height: 600).offset(x:-80)
                        
                        
                        .background(Color.white)
                        .clipShape(Rounded())
                }.frame(height:800).offset(y:50)
            }}}}

struct reviewcard_Previews: PreviewProvider {
    static var previews: some View {
        reviewcard(it: item(name: "Old man", price: 5, desc: "Ahmed"),total: 0)
    }
}
struct Roundedd : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight,.bottomLeft,.bottomRight], cornerRadii: CGSize(width: 35, height: 30))
        return Path(path.cgPath)
    }
}

struct listeditem: View {
    var it : item
    var body: some View {
        VStack{
            HStack(spacing:90){
                HStack(spacing:5){  Image(self.it.name)
                    .resizable()
                    .frame(width: 60, height: 60, alignment: .topTrailing)
                    .cornerRadius(15)
                    //  .offset(x:-50)
                    Text(self.it.name)
                        .font(.custom("SignPainter", size: 30))
                    //   .offset(x:-90)
                }
                Text("\(self.it.price) KD")
                    .font(.custom("SignPainter", size: 30))
                //  .offset(x:-90)
                
                
            } .frame(width:300,height: 90).background(Color.init("Color")).cornerRadius(15).offset(x:80)
            
        }
    }
}
