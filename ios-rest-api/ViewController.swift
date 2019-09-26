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
    
    var UserID : String?
    var FirstName : String?
    var LastName : String?
    var PhoneNumber : String?
    var SID : String?
    
    static func fetch(withID id :Int){
        let URLstring = DomainURL + "users/UserId/\(id)"
        if let url = URL.init(string: URLstring){
            let task = URLSession.shared.dataTask(with:url, completionHandler: {(data,URLResponse,error) in
                print(String.init( data: data! , encoding: .ascii) ?? "no data")
                if let newUser = try? JSONDecoder().decode(User.self, from: data!){
                    print (newUser.UserID ?? "no url")
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
        User.fetch(withID : 1)
    }
    
    
}


