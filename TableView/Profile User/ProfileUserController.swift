//
//  ProfileUserController.swift
//  TableViewExample
//
//  Created by Namira Rizqi Annisa on 06/05/21.
//  Copyright © 2021 CodeWithCal. All rights reserved.
//

import UIKit

class ProfileUserController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func editBtn (_sender: UIButton)
    {
        let editText = textField.text
        textView.text = editText
    }
    
    @IBAction func saveBtn (_sender: UIButton)
    {
        let editText = textField.text
        textView.text += editText ?? ""
        
    }


}
