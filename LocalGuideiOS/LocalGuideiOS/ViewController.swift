//
//  ViewController.swift
//  LocalGuideiOS
//
//  Created by Zhancheng Song on 2021-04-11.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var displayName: UILabel!
    @IBOutlet weak var jwtToken: UILabel!
    
    let context = ( UIApplication.shared.delegate as! AppDelegate ).persistentContainer.viewContext
    var users: [User]?
    
    var userService: UserService = UserService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchUserProfile()
        
    }
    
    func fetchUserProfile() {
        do {
            try users = context.fetch(User.fetchRequest())
            DispatchQueue.main.async {
                if (self.users!.count == 1) {
                    self.displayName.text = self.users![0].displayName
                    self.jwtToken.text = self.users![0].jwtToken
                }
     
            }
        } catch {
            
        }
        
    }
    
    @IBAction func onLoginPress(_ sender: Any) {
        self.userService.loginUser(username: username.text!,password: password.text!) { (result) in
            switch result {
            case .success(let userObj):
                print(userObj)
                let userToSave = User(context: self.context)
                userToSave.displayName = userObj.displayName
                userToSave.jwtToken = userObj.jwtToken
                userToSave.refreshToken = userObj.refreshToken
                print(userToSave)
                do {
                    try self.context.save()
                    self.fetchUserProfile()
                } catch {
                    
                }
            case .failure(let error):
                print(error)
            }
            
        }
    }
    

}

