//
//  UserDetailsViewController.swift
//  hW2.4.2
//
//  Created by Алексей Трофимов on 02.11.2021.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    @IBOutlet var userNameLabel: UILabel!
    var userNameDVC: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameLabel.text = userNameDVC
    }
    
    @IBAction func cancelAction(){
        dismiss(animated: true)
    }
    
}
