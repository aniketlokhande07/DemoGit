//
//  ViewController.swift
//  DemoGit
//
//  Created by saiusers on 28/03/18.
//  Copyright © 2018 saiusers. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet var email: UITextField!
    @IBOutlet var txtpassword: UITextField!
    
    var activeTextfiled : UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        email.delegate = self
        txtpassword.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    // textfield methods
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(textField.text)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func LoginApp(_ sender: Any) {
  
        if ((email.text?.trimmingCharacters(in: .whitespaces) != nil ) && (txtpassword.text?.trimmingCharacters(in: .whitespaces)) != nil){
            
            let alert = UIAlertController(title: "Demo", message: "Login Successfully.", preferredStyle: .alert)
            let Ok = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(Ok)
            present(alert, animated: true, completion: nil)
            
        }
        
        
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

