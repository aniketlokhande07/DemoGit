//
//  CalenderViewController.swift
//  DemoGit
//
//  Created by saiusers on 25/04/18.
//  Copyright © 2018 saiusers. All rights reserved.
//

import UIKit
import JTAppleCalendar

class ResponsiveView: UIView {
    override var canBecomeFirstResponder: Bool {
        return true
    }
}
class CalenderViewController: UIViewController,JTAppleCalendarViewDelegate,JTAppleCalendarViewDataSource {

    var responsiveView: ResponsiveView!
    let formater = DateFormatter()
    
    @IBOutlet var calenderview: JTAppleCalendarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        calenderview.calendarDelegate = self
        calenderview.calendarDataSource = self
        
        
        responsiveView = ResponsiveView()
        
        // Add our responsive view to a super view
        responsiveView.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        responsiveView.center = self.view.center
        responsiveView.backgroundColor = UIColor(red: 124.0/255.0, green: 112.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        responsiveView.layer.cornerRadius = 4;
        responsiveView.layer.masksToBounds = true
        self.view.addSubview(responsiveView)
        
        // Add a long press gesture recognizer to our responsive view
        responsiveView.isUserInteractionEnabled = true
        let longPressGR = UILongPressGestureRecognizer(target: self, action: #selector(longPressHandler))
        longPressGR.minimumPressDuration = 0.3 // how long before menu pops up
        responsiveView.addGestureRecognizer(longPressGR)
        
        // Do any additional setup after loading the view.
    }
    @objc func longPressHandler(sender: UILongPressGestureRecognizer) {
        guard sender.state == .began,
            let senderView = sender.view,
            let superView = sender.view?.superview
            else { return }
        
        // Make responsiveView the window's first responder
        senderView.becomeFirstResponder()
        
        // Set up the shared UIMenuController
        let saveMenuItem = UIMenuItem(title: "Save", action: #selector(saveTapped))
        let deleteMenuItem = UIMenuItem(title: "Delete", action: #selector(deleteTapped))
        UIMenuController.shared.menuItems = [saveMenuItem, deleteMenuItem]
        
        // Tell the menu controller the first responder's frame and its super view
        UIMenuController.shared.setTargetRect(senderView.frame, in: superView)
        
        // Animate the menu onto view
        UIMenuController.shared.setMenuVisible(true, animated: true)
    }
    
    @objc func saveTapped() {
        print("save tapped")
        // ...
        // This would be a good place to optionally resign
        // responsiveView's first responder status if you need to
        responsiveView.resignFirstResponder()
    }
    
    @objc func deleteTapped() {
        print("delete tapped")
        // ...
        responsiveView.resignFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        
    }
    
    
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formater.dateFormat = "yyyy mm dd"
        formater.timeZone = Calendar.current.timeZone
        formater.locale = Calendar.current.locale
        
        let startDate = formater.date(from: "2016 01 01")
        let endDate = formater.date(from: "2018 12 31")
        let parameters = ConfigurationParameters(startDate: startDate!, endDate: endDate!)
        return parameters
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "customcell", for: indexPath) as! customCell
    
        cell.datalabel.text = cellState.text
       
        return cell
    }
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        guard var validcell = cell as? customCell else { return }
        validcell.selectedView.isHidden = false
    
        validcell.selectedView.layer.cornerRadius = 20.0
        
        
    }
    

}

