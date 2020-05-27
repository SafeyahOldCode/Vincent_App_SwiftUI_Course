//
//   Categories.swift
//  projecttest
//
//  Created by sarah alshammari on 5/16/20.
//  Copyright © 2020 sarah alshammari. All rights reserved.
//

import SwiftUI

struct _Categories: View {
    var it : String = ""
    var body: some View {
        
        NavigationView{
            VStack(alignment: .center){
                Spacer()
                
                headTitle(textline: "  What are you looking for ?")
                
                image()
                
                
                Spacer()
                
                
            }
            .edgesIgnoringSafeArea(.vertical)
            
        }.accentColor(.black)
        
    }
    
}

struct _Categories_Previews: PreviewProvider {
    static var previews: some View {
        _Categories()
    }
}

struct headTitle: View {
    var textline: String
    var body: some View {
        
        Text(textline)
            .fixedSize(horizontal: false, vertical: true)
            .font(.custom("SignPainter", size: 40))
            //.padding()
            //.padding(.horizontal, 50)
            //.padding(.vertical, 10)
            //.background(Color.init("Color"))
            // .clipShape(Capsule())
            // .frame(width: 300, height:100)
            .animation(Animation.easeInOut(duration: 0.6).delay(2))
    }
}

struct image: View {
    var body: some View {
        VStack(spacing:20){
            
            NavigationLink(destination:CategoriesDetails(CategoriesName: "Painting")){
                
                Image("painnt").renderingMode(.original)
                    .resizable()
                    .padding(.horizontal, 30)
                    .padding(.vertical, 30)
                    .background(Color.init("Color"))
                    .clipShape(Capsule())
                    .frame(width: 200, height:200)
                    .transition(AnyTransition.slide).animation(.default)
            }.padding()
            
            
            NavigationLink(destination:CategoriesDetails(CategoriesName: "Photography")){
                
                Image("camera").renderingMode(.original)
                    .resizable()
                    .padding(.horizontal, 30)
                    .padding(.vertical, 30)
                    .background(Color.init("Color"))
                    .clipShape(Capsule())
                    .frame(width: 200, height:200)
                    .animation(Animation.easeInOut(duration: 0.6).delay(2))
                
            }.padding()
            
            
        }
    }
}


