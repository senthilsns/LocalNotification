//
//  Copyright © personal, Inc. All rights reserved.
//


import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    

    @IBAction func pressmeAction(_ sender: Any) {
        
        UIApplication.shared.applicationIconBadgeNumber = 1
      //  UNUserNotificationCenter.current().setBadgeCount(1) //iOS 16


        // Request Notification Settings
           UNUserNotificationCenter.current().getNotificationSettings { (notificationSettings) in
               switch notificationSettings.authorizationStatus {
               case .notDetermined:
                   self.requestAuthorization(completionHandler: { (success) in
                       guard success else { return }
                       // Schedule Local Notification
                       self.scheduleLocalNotification()
                   })
               case .authorized:
                   // Schedule Local Notification
                   self.scheduleLocalNotification()
                   break
               case .denied:
                   print("Application Not Allowed to Display Notifications")
               case .provisional: break
               case .ephemeral: break
               @unknown default: break
               }
           }
        
    }
    
    // MARK: - Private Methods

    private func requestAuthorization(completionHandler: @escaping (_ success: Bool) -> ()) {
        // Request Authorization
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge, .carPlay]) { (success, error) in
            if let error = error {
                print("Request Authorization Failed (\(error), \(error.localizedDescription))")
            }

            completionHandler(success)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UNUserNotificationCenter.current().delegate = self
        

        


    }
    
    
    private func scheduleLocalNotification() {
        // Create Notification Content
        let notificationContent = UNMutableNotificationContent()

        // Configure Notification Content
        notificationContent.title = "Sample"
        notificationContent.subtitle = "We Missed You!"
        notificationContent.body = "Dear User, You have not yet opened the App for last 14 Days!"

        // Add Trigger
        let notificationTrigger = UNTimeIntervalNotificationTrigger(timeInterval: 5.0, repeats: false)

        // Create Notification Request
        let notificationRequest = UNNotificationRequest(identifier: "sample_local_notification", content: notificationContent, trigger: notificationTrigger)

        // Add Request to User Notification Center
        UNUserNotificationCenter.current().add(notificationRequest) { (error) in
            if let error = error {
                print("Unable to Add Notification Request (\(error), \(error.localizedDescription))")
            }
        }
    }

    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.list,.badge,.banner,.sound])
    }

}

