//
//  LoginManager.swift
//  assetz-property
//
//  Created by Anant on 07/07/2016.
//  Copyright © 2016 Anant. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class LoginManager{
    
    var isLoggedIn = false
    var personOK = false
    var JSCount = 0
    var persons = [Person]()
    
    func loginWithUsername(username: String, password: String, callback: (Bool)->Void) {
        if username != "" && password != "" {
            
            Alamofire.request(.GET, "http://www.assetz.co.uk/App/Property/IOS/9.0/json-login.php", parameters:["a":"\(username)", "p":"\(password)"] )
                .validate()
                .responseJSON { response in
                    
                    
                    if let jsonData = response.result.value {
                        let JScount1 = jsonData.count
                        self.JSCount = JScount1
                        
                        for index in 0..<JScount1 {
                            print(jsonData)
                            
                            let personID = jsonData[index]["personID"] as? String
                            let personName = jsonData[index]["personName"] as? String
                            let personLastName = jsonData[index]["personLastName"] as? String
                            let personEmail = jsonData[index]["personEmail"] as? String
                            
                            let person = Person(firstname: personName!, surname: personLastName!, email: personEmail!, userID: personID!)
                            self.persons.append(person)
                        }
                        
                        ///print("JSCounter is \(self.JSCount)")
                        if(self.JSCount > 0){
                           // print("JSCOUNT is \(self.JSCount)")
                            self.isLoggedIn = true
                            callback(true)
                        }else{
                            //print("False 1")
                            callback(false)
                        }
                    }else{
                        //print("False 1")
                        callback(false)
                    }
            }
        }else{
            //print(6)
            callback(false)
        }
    }
    
    static let sharedInstance = LoginManager()
    
    private init() {
        
    }
}