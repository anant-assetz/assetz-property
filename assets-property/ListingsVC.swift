//
//  ListingsVC.swift
//  assetz-property
//
//  Created by Anant on 12/07/2016.
//  Copyright © 2016 Anant. All rights reserved.
//

import UIKit
import Alamofire

class ListingsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        getJsonData("First Try")

    }
    @IBAction func backBtnPressed(sender: AnyObject) {
                 dismissViewControllerAnimated(true, completion: nil)
    }

    
    
    
    func getJsonData(from:String){
        print(from)
        let jsonUrl = "http://www.assetz.co.uk/scripts/json-prop-list.php"
        let shotsUrl:NSURL = NSURL(string: jsonUrl)!
        
        let session = NSURLSession.sharedSession()
        //let urlRequest: NSMutableURLRequest = NSMutableURLRequest(URL: shotsUrl)
        let task = session.dataTaskWithURL(shotsUrl) {
            (data, response, error) -> Void in
            
            let httpResponse = response as! NSHTTPURLResponse
            let statusCode = httpResponse.statusCode
            
            if (statusCode == 200) {
                
                do {
                    let jsonData = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments)
                    
                    //self.propArray = jsonData as! [Property]
                    
                    let count = jsonData.count
                    
                    for index in 0..<count {
                        
                        let propID = jsonData[index]["propID"] as? String
                        var propName = jsonData[index]["propName"] as? String
                        let propMainImage = jsonData[index]["propMainImage"] as? String
                        //let propLowPrice = jsonData[index]["propLowPrice"] as? String
                        //let propHighPrice = jsonData[index]["propHighPrice"] as? String
                        //let propSummary:String! = jsonData[index]["propSummary"]!! as AnyObject as! String
                        //let propDescription:String! = jsonData[index]["propDescription"]!! as AnyObject as! String
                        //let propLocation:String! = jsonData[index]["propLocation"]!! as AnyObject as! String
                        
                        print(propID!)
                        print(propName!)
                        print(propMainImage!)
                        //print(propLowPrice!)
                        //print(propHighPrice!)
                        //print(propSummary!)
                        //print(propDescription!)
                        //print(propLocation!)
                        
                        self.getImageFiles(propMainImage!)
                        
                        if (propName == nil) {
                            propName = "none"
                        }
                        
                        var propertyline = Property(propID: propID!, propDesc: propName!, imagePath: propMainImage!)
                        //self.propArray.append(propertyline)
                        //print("This is counting \(self.propArray.count)")
                        
                        
                    }
                    
                    let jsonDict = jsonData
                    
                    //2
                    let jsonFile = FileSaveHelper(fileName:"jsonFile", fileExtension: .JSON, subDirectory: "SavingFiles", directory: .DocumentDirectory)
                    
                    
                    //3
                    do {
                        try jsonFile.saveFile(dataForJson: jsonDict)
                    }
                    catch {
                        print(error)
                    }
                    
                    
                    /*do {
                     print(try jsonFile.getJSONData())
                     } catch {
                     print(error)
                     }
                     */
                    
                    //4
                    print("JSON file exists: \(jsonFile.fileExists)")
                    NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: "dataLoaded", object: nil))
                } catch _ {
                    print(error)
                    // Error
                }
            }
        }
        task.resume()
        
    }
    
    
    var img: UIImage!
    //let imagePathFile = "http://investors.assetz.co.uk/prop-images/resp-listing/"
    
    func getImageFiles(imgName:String){
        
        var imgNameArray = imgName.characters.split{$0 == "."}.map(String.init)
        var imageNameOnly = imgNameArray[0]
        
        //let fullPathName = "\(self.imagePathFile)7726_1454581127.jpg"
        img = UIImage(named: imgName)
        
        // 1
        let imageToSave = FileSaveHelper(fileName: imageNameOnly, fileExtension: .JPG, subDirectory: "image", directory: .DocumentDirectory)
        
        // 2
        do {
            
            try imageToSave.saveFile(imgName)
            // 3
            guard let image = UIImage(named: imageNameOnly) else {
                print("Error getting image")
                return
            }
            // 4
            
        }
            // 5
        catch {
            print(error)
        }
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var property: Property!
        
        //let jsonCount = person.count
        //print("This is count \(jsonCount)")
        
        if let cell = tableView.dequeueReusableCellWithIdentifier("propertyCell") as? listingList {
            
            print("Checking Data")
            
            //NumberofRows = jsonCount - 1
            /*
            if NumberofRows > 0 {
                
                print("got Data")
                let property = propArray[indexPath.row]
                
                if let cell = tableView.dequeueReusableCellWithIdentifier("propertyCell") as? listingList {
                    cell.configureCell2(property)
                    print("A")
                    return cell
                }else{
                    let cell = listingList()
                    cell.configureCell2(property)
                    print("B")
                    return cell
                }
                
            }else{           //cell.configureCell(img, text: testFile)
                
                
            }
            */
            return cell
        }
        
        return listingList()
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
    }

    
}