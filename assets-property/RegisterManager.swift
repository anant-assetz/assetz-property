//
//  RegisterManager.swift
//  assetz-property
//
//  Created by Anant on 13/07/2016.
//  Copyright © 2016 Anant. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class RegisterManager{
    
    var isLoggedIn = false
    var personOK = false
    var JSCount = 0
    var persons = [Person]()
    
    func registerWithUsername(username: String, email: String,telephone: String, callback: (Bool)->Void) {
        if username != "" && email != "" {
            
            Alamofire.request(.GET, "http://www.assetz.co.uk/App/Property/IOS/9.0/json-register.php", parameters:["a":"\(username)", "e":"\(email)", "t":"\(telephone)"] )
                .validate()
                .responseJSON { response in
                    
                    //print(response.result.value)
                   
                    if let jsonData = response.result.value {
                      print(jsonData)
                        let JScount1 = jsonData.count
                        self.JSCount = JScount1
                        
                        for index in 0..<JScount1 {
                            
                            let personID = jsonData[index]["Person_ID"] as? String
                            let personName = jsonData[index]["Person_Name"] as? String
                            let personPhone = jsonData[index]["Person_Phone"] as? String
                            let personEmail = jsonData[index]["Person_Email"] as? String
                            
                            print(personID!)
                            print(personName!)
                            print(personEmail!)
                            print("-------------------------------------------")
                        
                            let person = Person(firstname: personName!, telephone: personPhone!, email: personEmail!, userID: personID!)
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
    
    static let sharedInstance = RegisterManager()
    
    private init() {
        
    }
}