//
//  ViewController.swift
//  ios-rest-api
//
//  Created by Brian Bansenauer on 9/25/19.
//  Copyright © 2019 Cascadia College. All rights reserved.
//

import UIKit
    //Using the URL and example from Lynda.com bc the URL provided doesn't work
    let DomainURL = "https://www.orangevalleycaa.org/api/"
    
class Music:Codable {
    
    var id : String?
    var music_url : String?
    var name : String?
    var description : String?
        
        static func fetch(withID id: Int){
            let URLstring = DomainURL + "music/id\(id)" //users/id\(id)
            
            if let url = URL.init(string: URLstring){
                let task = URLSession.shared.dataTask(with: url, completionHandler:
                {(data, response, error) in
                    print(String.init(data: data!, encoding: .ascii) ?? "no data")
                    
                if let newMusic = try? JSONDecoder().decode(Music.self, from: data!) {
                print (newMusic.music_url ?? "no url")
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
        Music.fetch(withID: 1)
    }


}

