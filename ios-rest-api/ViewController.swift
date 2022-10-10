//
//  ViewController.swift
//  ios-rest-api
//
//  Created by Brian Bansenauer on 9/25/19.
//  Copyright © 2019 Cascadia College. All rights reserved.
//

import UIKit

    let DomainURL = "https://mockend.com/MikeTheGreat/ios-rest-api-placeholder-data/"
    
    class User {
        
        static func fetch(withID id:Int){
            let URLstring = DomainURL + "matches/\(id)"
            if let url = URL.init(string: URLstring){
                let task = URLSession.shared.dataTask(with: url, completionHandler: {(dataFromAPI, urlResponse, error) in
                    print(String.init(data: dataFromAPI!, encoding: .ascii) ?? "no data")
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
        User.fetch(withID: 100)
    }


}

