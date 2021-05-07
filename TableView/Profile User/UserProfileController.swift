//
//  UserProfileController.swift
//  TableViewExample
//
//  Created by Namira Rizqi Annisa on 06/05/21.
//

import UIKit

class UserProfileController: UITableViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.returnKeyType = .done
        
        textField.text = "Namira"
    }
    
    @IBAction func editBtn (_sender: UIButton)
    {
        textField.resignFirstResponder()
        
    }
    
    
}
