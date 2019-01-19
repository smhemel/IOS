//
//  ViewController.swift
//  Log in Demo
//
//  Created by S M HEMEL on 19/1/19.
//  Copyright © 2019 S M HEMEL. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    var isLoggedIn = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            for result in results as! [NSManagedObject] {
                if let username = result.value(forKey: "Name") as? String {
                    textField.alpha = 0
                    logInButton.setTitle("Update username", for: [])
                    label.alpha = 1
                    logOutButton.alpha = 1
                    label.text = "Hi there " + username + "!"
                }
            }
        } catch {
            print("Request failed.")
        }
    }
    
    // MARK:- Log In part
    @IBAction func logIn(_ sender: Any) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        if isLoggedIn {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            do {
                let results = try context.fetch(request)
                
                if results.count > 0 {
                    for result in results as! [NSManagedObject] {
                        result.setValue(textField.text, forKey: "name")
                        do {
                            try context.save()
                        } catch {
                            print("Update username save failed")
                        }
                    }
                    label.text = "Hi there" + textField.text! + "!"
                }
            } catch {
                print("Update username failed")
            }
            
        } else {
            let newValue = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
            newValue.setValue(textField.text, forKey: "name")
            do {
                try context.save()
                logInButton.setTitle("Update Username", for: [])
                label.alpha = 1
                label.text = "Hi there " + textField.text! + "!"
                isLoggedIn = true
                logOutButton.alpha = 1
            } catch{
                print("Failed to save")
            }
            
        }
    }
    
    // MARK:- Log Out part
    @IBAction func logOut(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        do {
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    context.delete(result)
                    do {
                        try context.save()
                    } catch {
                        print("Individual delete failed")
                    }
                }
                label.alpha = 0
                logOutButton.alpha = 0
                logInButton.alpha = 1
                logInButton.setTitle("Log In", for: [])
                isLoggedIn = false
            }
        } catch {
            print("Delete failed")
        }
    }
    

}

