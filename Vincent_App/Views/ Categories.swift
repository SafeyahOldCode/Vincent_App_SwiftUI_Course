//
//   Categories.swift
//  projecttest
//
//  Created by sarah alshammari on 5/16/20.
//  Copyright © 2020 sarah alshammari. All rights reserved.
//

import SwiftUI

struct _Categories: View {
    var it : String
    var body: some View {
        
        NavigationView{
            VStack(alignment: .center){
                Spacer()
                text()
                NavigationLink(destination:SwiftUIView(it:it)){
                    image()
                }
                Spacer()
            }.edgesIgnoringSafeArea(.vertical)
        }
        
        
        
    }
}

struct _Categories_Previews: PreviewProvider {
    static var previews: some View {
        _Categories(it: "Panting")
    }
}

struct text: View {
    var body: some View {
        
        Text("  What are you looking for ?")
            .fixedSize(horizontal: false, vertical: true)
            .font(.custom("SignPainter", size: 40))
            // .padding()
            .padding(.horizontal, 50)
            .padding(.vertical, 10)
            .background(Color.init("Color"))
            .clipShape(Capsule())
            .frame(width: 300, height:100)
            .animation(Animation.easeInOut(duration: 0.6).delay(2))
    }
}

struct image: View {
    var body: some View {
        VStack(spacing:10){
            Image("painnt").renderingMode(.original)
                .resizable()
                .padding(.horizontal, 30)
                .padding(.vertical, 30)
                .background(Color.init("Color"))
                .clipShape(Capsule())
                .frame(width: 200, height:200)
                // .animation(Animation.easeInOut(duration: 0.6).delay(2))
                .transition(AnyTransition.slide).animation(.default)
            Image("camera").renderingMode(.original)
                .resizable()
                .padding(.horizontal, 30)
                .padding(.vertical, 30)
                .background(Color.init("Color"))
                .clipShape(Capsule())
                .frame(width: 200, height:200)
                .animation(Animation.easeInOut(duration: 0.6).delay(2))
            
            
        }
    }
}
