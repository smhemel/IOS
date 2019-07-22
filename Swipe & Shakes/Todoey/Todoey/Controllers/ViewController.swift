//
//  ViewController.swift
//  Todoey
//
//  Created by S M HEMEL on 20/7/19.
//  Copyright © 2019 S M HEMEL. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Welcome";
    }
//    @IBAction func clickMenuButton(_ sender: Any) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil);
//        let TodoList = storyboard.instantiateViewController(withIdentifier: "TodoListTableViewControllerID") as! TodoListTableViewController;
//        self.navigationController?.pushViewController(TodoList, animated: true);
//    }
    

}

