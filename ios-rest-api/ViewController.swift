//
//  ViewController.swift
//  ios-rest-api
//
//  Created by Brian Bansenauer on 9/25/19.
//  Copyright © 2019 Cascadia College. All rights reserved.
//

import UIKit

    let DomainURL = "http://216.186.69.45/services/device/"
    
class User : Codable {
        var userID : String?
        var firstName : String?
        var lastName : String?
        var phoneNumber : String?
        var sid : String?
    
        enum CodingKeys : String, CodingKey{
            case userID = "UserID"
            case firstName = "FirstName"
            case lastName = "LastName"
            case phoneNumber = "PhoneNumber"
            case sid = "SID"
        }
        
        static func fetch(withID: Int){
            let URLstring = DomainURL + "users/" + "\(withID)"
            if let url = URL.init(string: URLstring){
                let task = URLSession.shared.dataTask(with: url, completionHandler:
                {(API_data, urlResponse, error) in
                    print(String.init(data: API_data!, encoding: .ascii) ?? "no data")
                    if let newUser = try? JSONDecoder().decode(User.self, from: API_data!){
                        print(newUser.firstName ?? "no name")
                    }
                })
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
        User.fetch(withID: 2)
    }


}

