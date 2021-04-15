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
    
    var userService: UserService = UserService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func onLoginPress(_ sender: Any) {
        self.userService.loginUser(username: username.text!,password: password.text!) { (result) in
            switch result {
            case .success(let userObj):
                print(userObj)
            case .failure(let error):
                print(error)
            }
            
        }
    }
    

}

