//
//  HomeViewController.swift
//  DemoGit
//
//  Created by saiusers on 28/03/18.
//  Copyright © 2018 saiusers. All rights reserved.
//

import UIKit
//import ANLoader


class HomeViewController: UIViewController {

    let imagePicker = UIImagePickerController()
    let messageFrame = UIView()
    var activityIndicator = UIActivityIndicatorView()
    var strLabel = UILabel()
    let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        var str = "welcome into sai to"
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func Startanimating(_ sender: Any) {
   
      //  activityIndicator("Creating PDF")
       // ANLoader.showLoading("Uploading images", disableUI: false)
        
    
    }
    @IBAction func stopAnimating(_ sender: Any) {
   
       // activityIndicator.stopAnimating()
       //effectView.isHidden = true
//ANLoader.hide()
  
    }
    
    @IBAction func showCalender(_ sender: Any) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "CalenderViewController") as! CalenderViewController
        navigationController?.pushViewController(controller, animated: true)
        
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
        effectView.isHidden = false
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .white)
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 46, height: 46)
        activityIndicator.startAnimating()
        
        effectView.contentView.addSubview(activityIndicator)
        effectView.contentView.addSubview(strLabel)
        view.addSubview(effectView)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
