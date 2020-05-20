//
//  User.swift
//  VincentApp
//
//  Created by Eng.shoqi aldh on 5/16/20.
//  Copyright © 2020 Eng.shoqi aldh. All rights reserved.
//
//
//import Foundation
//struct User{
//    var email: String
//  var password: String
//    var type: String
//    var category: Categor
//}
//enum Categor {
//    case drawing,painting
//}

    import Foundation
//    import FirebaseFirestore
//    import class Firebase.User
//    typealias FirebaseUser = Firebase.User


    /// DONT edit this part
    protocol User: Codable{
        var uid: String? {get set}
        var firstname: String {get set}
        var lastname: String {get set}
        var email: String {get set}
        var phoneNumber: String {get set}
        var userType: String {get set}
    }

    extension User{
        func fullName() -> String{
            firstname + " " + lastname
        }
    }


    /// You can customize your user here.
    struct AppUser: User{
        var uid: String? = nil
        var firstname: String = ""
        var lastname: String = ""
        var email: String = ""
        var phoneNumber: String = ""
        var userType: String = ""
    }


    struct SignInCredentials: Encodable
    {
        var email: String
        var password: String
    }

