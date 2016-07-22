//
//  Person.swift
//  assetz-property
//
//  Created by Anant on 11/07/2016.
//  Copyright © 2016 Anant. All rights reserved.
//

import Foundation
import UIKit

class Person{
    
    private var _firstname:String!
    private var _surname:String?
    private var _email:String!
    private var _userID:String!
    private var _telephone:String!
    
    var firstname:String  {
        
        return _firstname
    }
    
    var surname:String? {
        return _surname
    }
    
    var telephone:String? {
        return _telephone
    }
    
    var email: String {
        
        return _email
    }
    
    var userID:String{
        return _userID
    }
    
    init(firstname: String, surname: String?, email: String, userID: String) {
        self._firstname = firstname
        self._surname = surname
        self._email = email
        self._userID = userID
    
        print("Firstname - \(self._firstname) and Email is \(self._email)")
        print(email)
        
    }
    
    init(firstname: String, telephone: String?, email: String, userID: String) {
        self._firstname = firstname
        self._telephone = telephone
        self._email = email
        self._userID = userID
        
        print("Firstname - \(firstname) and Email is \(email) and Telephone is \(telephone)")
        print(email)
        
    }
    
    init(){
    }

    
}