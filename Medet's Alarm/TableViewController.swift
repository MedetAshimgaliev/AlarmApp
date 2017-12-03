//
//  TableViewController.swift
//  Medet's Alarm
//
//  Created by Almaz Suraganov on 27.11.17.
//  Copyright © 2017 Almaz Suraganov. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications


class TableViewController : UITableViewController {
    
    var dataSource: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: {didAllow, Error in})
    }
    
    
    func register()
    {
        let notificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
        UIApplication.shared.registerUserNotificationSettings(notificationSettings)
    }
  
    
    func addTimes(dateString: String){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        let ddate = dateFormatter.date(from: dateString)
        
        
        print(ddate)
        let notification = UILocalNotification()
        notification.fireDate = ddate  //NSDate(timeIntervalSinceNow: 5) as Date
        notification.alertBody = "Wake up"
        notification.alertAction = "Alarm clock!"
        notification.soundName = UILocalNotificationDefaultSoundName
        notification.userInfo = ["CustomField1": "w00t"]
        UIApplication.shared.scheduleLocalNotification(notification)
        
        guard let settings = UIApplication.shared.currentUserNotificationSettings else { return }
        
        if settings.types == [] {
            let ac = UIAlertController(title: "Can't schedule", message: "Either we don't have permission to schedule notifications, or we haven't asked yet.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(ac, animated: true, completion: nil)
            return
        }
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void)
    {
        completionHandler([.alert, .badge, .sound])
    }
//    @IBAction func scheduleLocal(sender: AnyObject) {
//        let notification = UILocalNotification()
//        notification.fireDate = NSDate(timeIntervalSinceNow: 5) as Date
//        notification.alertBody = "Hey you! Yeah you! Swipe to unlock!"
//        notification.alertAction = "be awesome!"
//        notification.soundName = UILocalNotificationDefaultSoundName
//        notification.userInfo = ["CustomField1": "w00t"]
//        UIApplication.shared.scheduleLocalNotification(notification)
//
//
//        guard let settings = UIApplication.shared.currentUserNotificationSettings else { return }
//
//        if settings.types == [] {
//            let ac = UIAlertController(title: "Can't schedule", message: "Either we don't have permission to schedule notifications, or we haven't asked yet.", preferredStyle: .alert)
//            ac.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
//            present(ac, animated: true, completion: nil)
//            return
//        }
//
//    }
    
    

    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! CustomCell
        cell.cellLabel.text = dataSource[indexPath.row]
        register()
        addTimes(dateString: dataSource[indexPath.row])
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            dataSource.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
}
