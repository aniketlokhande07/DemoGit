//
//  ViewController.swift
//  DemoGit
//
//  Created by saiusers on 28/03/18.
//  Copyright © 2018 saiusers. All rights reserved.
//

import UIKit
import Firebase


class ViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet var email: UITextField!
    @IBOutlet var txtpassword: UITextField!
    
    
    
    let imagePicker = UIImagePickerController()
    let messageFrame = UIView()
    var activityIndicator = UIActivityIndicatorView()
    var strLabel = UILabel()
    let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    
    var activeTextfiled : UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        email.delegate = self
        txtpassword.delegate = self
        var str = "aniket"
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
            let Ok = UIAlertAction(title: "OK", style: .default, handler: {
                action in
                let controller = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
              self.navigationController?.pushViewController(controller, animated: true)
                
            })
            alert.addAction(Ok)
            present(alert, animated: true, completion: nil)
            
        }
        
        
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func activityIndicator(_ title: String) {
        
        strLabel.removeFromSuperview()
        activityIndicator.removeFromSuperview()
        effectView.removeFromSuperview()
        
        strLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 160, height: 46))
        strLabel.text = title
        strLabel.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.medium)
        strLabel.textColor = UIColor(white: 0.9, alpha: 0.7)
        
        effectView.frame = CGRect(x: view.frame.midX - strLabel.frame.width/2, y: view.frame.midY - strLabel.frame.height/2 , width: 160, height: 46)
        effectView.layer.cornerRadius = 15
        effectView.layer.masksToBounds = true
        
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        activityIndicator.startAnimating()
        
        effectView.contentView.addSubview(activityIndicator)
        effectView.contentView.addSubview(strLabel)
        view.addSubview(effectView)
    }


}

