//
//  ViewController.swift
//  LocalGuideiOS
//
//  Created by Zhancheng Song on 2021-04-11.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    var userStore: UserStore = UserStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onLoginPress(_ sender: Any) {
        self.userStore.registerUser(username: username.text!,password: password.text!)
    }
    

}

