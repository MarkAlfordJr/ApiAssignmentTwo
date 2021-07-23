//
//  ViewController.swift
//  AssignmentTwo
//
//  Created by Mark Alford on 7/22/21.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UITableViewController {
    
    //API url
    let urlString = "https://jsonplaceholder.typicode.com/users"
    
    //all arrays that must go into the table cell
    var itemCount = [Int]()
    var cellName = [String]()
    var cellUserName = [String]()
    var cellEmail = [String]()
    var cellStreet = [String]()
    var cellSuite = [String]()
    var cellCity = [String]()
    var cellZip = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //activates Alamofire api request
        getJson(url:urlString)
        
        print("test \(itemCount)")
        
        //load up tableview
        tableView.reloadData()
        
        //registers the Custom View, call its xib file and reusable id
        tableView.register(UINib(nibName: "UserInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "customUserCell")
    }


    
    
//    //MARK: - TableView Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //the number of cells based on JSON results
        return itemCount.count

    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //fixed hight of the cell
        return 250.0
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //call upon the custom table cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "customUserCell", for: indexPath) as! UserInfoTableViewCell
        
        //reference custom cell's elements
//        @IBOutlet weak var fullName: UILabel!
//        @IBOutlet weak var userName: UILabel!
//        @IBOutlet weak var email: UILabel!
//        @IBOutlet weak var address: UILabel!
//
        cell.fullName.text = cellName[indexPath.row]
        cell.userName.text = cellUserName[indexPath.row]
        cell.email.text = cellEmail[indexPath.row]
        cell.address.text = "\(cellStreet[indexPath.row]) \(cellSuite[indexPath.row]), \(cellCity[indexPath.row]), \(cellZip[indexPath.row])"
        
        return cell
    }
    
    

}

//MARK: - API functionality Extension
extension ViewController {
 
    
    //MARK: - Alamofire function
    public func getJson (url: String) {
        //activates the JSON parsing from the URL
        AF.request(url).responseJSON { [self] response in
            switch response.result {
            //if success, activate JSON parse
            case .success(let value):
                //make json value
                let json = JSON(value)
                
                
                //make a new mapped array of items from the JSON result variable
                let jsonItemArray = json[].arrayValue.map{$0["id"].intValue}
                //append map array into tableCell array
                itemCount.append(contentsOf: jsonItemArray)
                print(itemCount)
              
                
                //mapped array of names
                let jsonNameArray = json[].arrayValue.map{$0["name"].stringValue}
                //append map array into tableCell array
                cellName.append(contentsOf: jsonNameArray)
                print("cell names \(cellName)")
 
                
                //mapped array of usernames
                let jsonUserNameArray = json[].arrayValue.map{$0["username"].stringValue}
                //append map array into tableCell array
                cellUserName.append(contentsOf: jsonUserNameArray)
       
                
                //mapped array of emails
                let jsonUserEmailArray = json[].arrayValue.map{$0["email"].stringValue}
                //append map array into tableCell array
                cellEmail.append(contentsOf: jsonUserEmailArray)

            
                //mapped array of address street
                let jsonUserStreetArray = json[].arrayValue.map{$0["address"]["street"].stringValue}
                //append map array into tableCell array
                cellStreet.append(contentsOf: jsonUserStreetArray)
        
                
                //mapped array of address suite
                let jsonUserSuiteArray = json[].arrayValue.map{$0["address"]["suite"].stringValue}
                //append map array into tableCell array
                cellSuite.append(contentsOf: jsonUserSuiteArray)

                
                //mapped array of address city
                let jsonUserCityArray = json[].arrayValue.map{$0["address"]["city"].stringValue}
                //append map array into tableCell array
                cellCity.append(contentsOf: jsonUserCityArray)
     
                
                //mapped array of address zipcode
                let jsonUserZipArray = json[].arrayValue.map{$0["address"]["zipcode"].stringValue}
                //append map array into tableCell array
                cellZip.append(contentsOf: jsonUserZipArray)

                
                //load the table cell with this
                //IMPORTANT, similar to the protocal design pattern
                //makes the UI function, while the API is being handled
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
                
            //if failure, print out error
            case .failure(let error):
                print(error)
            }
            
        }//end of alamofire request
        
    }
    
}


