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
    
    var user_url : String?
        
        static func fetch(){
            let URLstring = DomainURL + "users/"
            if let url = URL.init(string: URLstring){
                let task = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in print(String.init(data: data!, encoding: .ascii) ?? "no data")
                    if let newUser = try? JSONDecoder().decode(User.self, from: data!){
                        print (newUser.user_url ?? "no url")
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
        User.fetch()
    }


}

