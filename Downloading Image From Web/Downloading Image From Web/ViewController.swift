//
//  ViewController.swift
//  Downloading Image From Web
//
//  Created by S M HEMEL on 20/1/19.
//  Copyright © 2019 S M HEMEL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bachImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Local Image Stores
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        if documentsPath.count > 0 {
            let documentsDirectory = documentsPath[0]
            let restorePath = documentsDirectory + "/bach.jpg"
            bachImageView.image = UIImage(contentsOfFile: restorePath)
        }
        
        
        //Download and Save
        
        let url = URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGTVf63Vm3XgOncMVSOy0-jSxdMT8KVJIc8WiWaevuWiPGe0Pm")!
        let request = NSMutableURLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print(error!)
            } else {
                if let data = data {
                    if let bachImage = UIImage(data: data) {
                        self.bachImageView.image = bachImage
                        
                        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
                        if documentsPath.count > 0 {
                            let documnetDirectory = documentsPath[0]
                            let savePath = documnetDirectory + "/bach.jpg"
                            do {
                                try bachImage.jpegData(compressionQuality: 1)?.write(to: URL(fileURLWithPath: savePath))
                            } catch {
                                //error massage
                            }
                        }
                    }
                }
            }
        }
        task.resume()
    }

}

