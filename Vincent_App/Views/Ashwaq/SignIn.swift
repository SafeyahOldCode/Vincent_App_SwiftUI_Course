//
//  ContentView.swift
//  VincentApp
//
//  Created by Eng.shoqi aldh on 5/15/20.
//  Copyright © 2020 Eng.shoqi aldh. All rights reserved.
//

import SwiftUI


struct SignIn: View {
    @State var credentials = SignInCredentials(email: "", password: "")
    @State var signedIn = false
    @State var signedInFailed = false
    
    
    //    @State  private var showingAlert = true
    var body: some View {
        NavigationView{
            ZStack{
                Color("BGColor")
                
                
                VStack(alignment: .center, spacing : 5){
                    
                    
                    Image("vincent")
                        .resizable()
                        .scaledToFit()
                        .clipShape(Capsule())
                        .overlay(Circle().stroke(Color.black,lineWidth: 2))
                        .shadow(radius: 0.9)
                        .frame(width: 200, height: 200 , alignment: .center)
                        .padding(.top)
                    
                    
                    Text("If you truly love Nature, you will find beauty everywhere.")
                        .bold()
                        .frame(width: 350, height: 45 , alignment: .leading)
                        .font(.system(size: 18))
                        .font(.caption)
                    
                    VStack( alignment: .trailing){
                        Text( "Van Gogh")
                            .bold()
                            .frame(width: 90, height: 20,alignment: .topTrailing)
                            .font(.system(size: 15))
                            .font(.caption)
                            .offset(x: 0 , y: -20)
                        TextField("Enter your Email",text: $credentials.email)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .frame(width: 300, alignment: .leading)
                            .offset( y: -20)
                        
                        TextField("Enter your password", text: $credentials.password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            .frame(width: 300,alignment: .leading)
                            .offset( y: -10)
                        
                        
                    }
                    .padding()
                    VStack(spacing: 10){
                       
                        Button(action: {
                            
                            self.signIn()
                            
                        }) {
                            
                            
                            NavigationLink(destination: ContentView()) {
                                Text("Sign in")
                                    
                                    .font(.custom("Helvetica Neue", size: 27))
                                    .fontWeight(.bold)
                                    .frame(width:170 ,height:50, alignment: .center)
                                    .background(Color("SigninColor"))
                                    .clipShape(Capsule())
                                    .foregroundColor(.white)
                                
                            }
                            
                            
                            
                            
                        }.padding(.bottom)
                        
                        
                        
                        Button(action: {
                            
                        }) {
                            
                            NavigationLink(destination: SignUpView() ) {
                                
                               Text("Sign up")
                                .font(.custom("Helvetica Neue", size: 27))
                                .fontWeight(.bold)
                                
                                .frame(width:170 ,height:50, alignment: .center)
                                .background(Color("SignupColor"))
                                .clipShape(Capsule())
                                .foregroundColor(.white)
                            }
                            
                            
                        }.padding(.bottom)
                        
                        
                        
                    }
                    
                }
                
            }
            .edgesIgnoringSafeArea(.all)
            .alert(isPresented: $signedIn, content: signInAlert)
            //           .padding()
            
            //        Button(action: {
            //            self.showingAlert = true
            //        }) {
            //            Text("Show Alert")
            //        }
            
            
            
            
            //        .alert(isPresented: $showingAlert) {
            //             Alert(title: Text("Welcome"), message: Text("It's our pleasure to serve you"), dismissButton:.default(Text("OK")))
            //
            //        }
            
            
        }.edgesIgnoringSafeArea(.all)
            .alert(isPresented: $signedInFailed, content: signInFailedAlert)
        
        
        
    }
    
    func signIn(){
        Networking.signIn(user: credentials, collectionName: "users", success: { str in
            // successfully signed
            self.signedIn = true
            
        }) {
            // fail
            self.signedInFailed = true
        }
        
      
    }
    
    func signInAlert() -> Alert{
        Alert(title: Text("Signed In 😍"), message: Text("You have signed in successfully with email \(self.credentials.email)."), dismissButton: .default(Text("Done")))
    }
    func signInFailedAlert() -> Alert{
        Alert(title: Text("Error!"), message: Text("Couldn't sign in with email \(self.credentials.email)."), dismissButton: .default(Text("Done")))
    }
    
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
