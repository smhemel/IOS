//
//  ViewController.swift
//  JsonDataParse
//
//  Created by S M HEMEL on 27/11/18.
//  Copyright © 2018 S M HEMEL. All rights reserved.
//

import UIKit


struct Course: Decodable {
    let id: Int
    let name: String
    let link: String
    let imageUrl: String
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/course"
        guard let url = URL(string: jsonUrlString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                return
            }
            //covert to the String
            //let dataAsString = String(bytes: data, encoding: .utf8)
            do {
                // if json is an array type
                // let course = try JSONDecoder().decode([Course.self],from: data)
                
                let course = try JSONDecoder().decode(Course.self, from: data)
                print(course)
            } catch let jsonError {
                print("Error: \(jsonError)")
            }
        }.resume()
    }


}

