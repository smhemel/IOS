//
//  ViewController.swift
//  Whats The Weather
//
//  Created by S M HEMEL on 29/12/2018.
//  Copyright © 2018 Eastern University. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var cityTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    
    @IBAction func getWeather(_ sender: AnyObject) {
        
    if let url = URL(string: "http://www.weather-forecast.com/locations/" + cityTextField.text!.replacingOccurrences(of: " ", with: "-") + "/forecasts/latest") {
        
    let request = NSMutableURLRequest(url: url)
        
    let task = URLSession.shared.dataTask(with: request as URLRequest) {
        data, response, error in
            
        var message = ""
        if error != nil {
            print(error!)
            } else {
                if let unwrappedData = data {
                    
                    let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                    
                    var stringSeparator = "Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">"
                    
                    if let contentArray = dataString?.components(separatedBy: stringSeparator) {
                        
                        if contentArray.count > 1 {
                            
                            stringSeparator = "</span>"
                            
                            let newContentArray = contentArray[1].components(separatedBy: stringSeparator)
                            
                            if newContentArray.count > 1 {
                                message = newContentArray[0].replacingOccurrences(of: "&deg;", with: "°")
                            }
                        }
                    }
                }
            }
            
        if message == "" {
            message = "The weather there couldn't be found. Please try again."
        }
            
        DispatchQueue.main.sync(execute: {
            self.resultLabel.text = message
        })
            
    }
        
        task.resume()
            
        } else {
            resultLabel.text = "The weather there couldn't be found. Please try again."
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

