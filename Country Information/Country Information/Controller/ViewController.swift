//
//  ViewController.swift
//  Country Information
//
//  Created by S M HEMEL on 21/2/19.
//  Copyright © 2019 S M HEMEL. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    struct currencie: Decodable {
        var code: String?
        var name: String?
        var symbol: String?
    }
    struct language: Decodable {
        var iso639_1: String?
        var iso639_2: String?
        var name: String?
        var nativeName: String?
    }
    struct regionalBloc: Decodable {
        var acronym: String?
        var name: String?
        var otherAcronyms = [String?]()
        var otherNames = [String?]()
    }
    struct allCountry: Decodable {
        var name: String?
        var topLevelBomain = [String?]()
        var alpha2Code: String?
        var alpha3Code: String?
        var callingCodes = [String?]()
        var capital: String?
        var altSpellings = [String?]()
        var region: String?
        var subregion: String?
        var population: Int?
        var latlng = [Int?]()
        var demonym: String?
        var area: Int?
        var gini: Float?
        var timezones = [String?]()
        var borders = [String?]()
        var nativeName: String?
        var numericCode: String?
        var currencies = [currencie?]()
        var languages = [language?]()
        var translations = [String?:String?]()
        var flag: String?
        var regionalBlocs = [regionalBloc?]()
        var cioc: String?
        
    }
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }


}

