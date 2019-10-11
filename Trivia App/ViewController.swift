//
//  ViewController.swift
//  Trivia App
//
//  Created by Mohammad Yunus on 10/10/19.
//  Copyright © 2019 taptap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // textfield to store name of the user
    @IBOutlet weak var name: UITextField!
    
    // to disable or enable button based on the textfield
    @IBOutlet weak var carryOnOutlet: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.delegate = self // to use textfield delegate method
        carryOnOutlet.isEnabled = false // since textfield is empty we disable it so that nil value is not passed to the next view controller resulting in break
        title = "Trivia App" // set navigation title
    }
    
    
    // after writing the name pressing this button will take you to the next view showing question
    @IBAction func carryon(_ sender: UIButton) {
        if let dvc = storyboard?.instantiateViewController(identifier: "qanda") as? QandA{
            dvc.username = name.text! //passing the user name to next view controller
            navigationController?.pushViewController(dvc, animated: true) // pushing new view controller on the navigation stack
        }
    }
    
}

// below extension check if the text if empty or nil
extension String{
    var isBlank: Bool{
        return allSatisfy({$0.isWhitespace})
    }
}

// textfield delegate methods
extension ViewController: UITextFieldDelegate{
    // as soon as user starts to write in textfield button is disabled to avoid any break
    func textFieldDidBeginEditing(_ textField: UITextField) {
        carryOnOutlet.isEnabled = false
    }
    
    // after pressing return key textfield resign first responder and keyboard is dismissed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        name.resignFirstResponder()
        return true
    }
    
    // as soon as user press return key and keyboard is dismissed it checks if name is not nil to enable the button or else it remains disables
    func textFieldDidEndEditing(_ textField: UITextField) {
        if name.text!.isBlank{
            carryOnOutlet.isEnabled = false
        }else{
            carryOnOutlet.isEnabled = true
        }
    }
    
    
    
    
}
