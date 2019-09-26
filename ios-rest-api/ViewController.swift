//
//  ViewController.swift
//  ios-rest-api
//
//  Created by Brian Bansenauer on 9/25/19.
//  Copyright © 2019 Cascadia College. All rights reserved.
//

import UIKit

    let DomainURL = "http://216.186.69.45/services/device/"
    
class User: Codable {
        
        var UserID: String?
        var FirstName: String?
        var LastName: String?
        var PhoneNumber: String?
        var SID: String?
        
        
        static func fetch(withId: Int){
            let URLstring = DomainURL + "users/\(withId)"
            
            if let url = URL.init(string: URLstring){
                let task = URLSession.shared.dataTask(with: url, completionHandler:
                    { (apiData, response, error) in
                        print(String.init(data: apiData!, encoding: .ascii) ?? "no data")
                        if let mUser = try? JSONDecoder().decode(User.self, from: apiData!) {
                            
                            print("\n\nLoading User...\nFirst Name: \(mUser.FirstName ?? "no first name on record")\nLast Name: \(mUser.LastName ?? "no last name on record")\nPhone Number: \(mUser.PhoneNumber ?? "no phone # on record")\nSID: \(mUser.SID ?? "no SID on record")")
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
        User.fetch(withId: 8)
    }


}

