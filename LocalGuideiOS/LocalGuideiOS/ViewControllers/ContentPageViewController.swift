//
//  ContentPageViewController.swift
//  LocalGuideiOS
//
//  Created by Zhancheng on 2021-04-16.
//

import UIKit

class ContentPageViewController: UIViewController {
    
    var userDisplayName: String = ""
    
    @IBOutlet weak var displayName: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        displayName.text = userDisplayName
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
