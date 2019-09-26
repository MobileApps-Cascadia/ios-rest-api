//
//  ViewController.swift
//  ios-rest-api
//
//  Created by Brian Bansenauer on 9/25/19.
//  Copyright © 2019 Cascadia College. All rights reserved.
//

import UIKit

    let DomainURL = "http://216.186.69.45/services/device/"
    
    class User {
        
        static func fetch(withId: Int){
            let URLstring = DomainURL + "users/\(withId)"
            if let url = URL.init(string: URLstring){
                let task = URLSession.shared.dataTask(with: url, completionHandler:
                    { (apiData, urlResponse, error) in
                        print(String.init(data: apiData!, encoding: .ascii) ?? "no data")
                    }
                )
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
        User.fetch(withId: 8)
    }


}

