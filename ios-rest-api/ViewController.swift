//
//  ViewController.swift
//  ios-rest-api
//
//  Created by Brian Bansenauer on 9/25/19.
//  Copyright © 2019 Cascadia College. All rights reserved.
//

import UIKit

    let DomainURL = "http://216.186.69.45/services/device/"
    
class User : Codable{
    
    var UserID: String?
    var FirstName: String?
    var LastName: String?
    var PhoneNumber: String?
    var SID: String?
    
        static func fetch(){
            let URLstring = DomainURL + "users/"
            if let url = URL.init(string: URLstring){
                let task = URLSession.shared.dataTask(with: url, completionHandler:{(dataFromApi,urlResponse,error) in
                    print(String.init(data: dataFromApi!, encoding: .ascii) ?? "no data")
                })
                    //TODO: Add closure
                
                task.resume()
            }
        }
    
    static func fetch(withId: Int){
        //add the \(UserID) after the users to get the specific UserID
        let URLstring = DomainURL + "users/\(withId)"
        if let url = URL.init(string: URLstring){
            let task = URLSession.shared.dataTask(with: url, completionHandler:{(dataFromApi,urlResponse,error) in
                print(String.init(data: dataFromApi!, encoding: .ascii) ?? "no data")
                //using Decodable
                if let newUser = try? JSONDecoder().decode(User.self, from: dataFromApi!){
                    print(newUser.FirstName ?? "no data" )
                    
                }
            })
                //TODO: Add closure
            
            task.resume()
        }
    }
    
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        User.fetch(withId: 7)
        User.fetch()
        
    }


}

