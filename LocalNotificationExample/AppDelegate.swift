//
//  Copyright © personal, Inc. All rights reserved.
//


import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
      UserDefaults.standard.set(Date(), forKey: "sample_Application_Last_Opened")

     //   UIApplication.shared.applicationIconBadgeNumber = 0
        
     let fleedClosedDate = UserDefaults.standard.object(forKey: "sample_Application_Last_Opened") as! Date
    
     //   let fleedClosedDate = Calendar.current.date(byAdding: .day, value: 14, to: Date()) ?? Date()
        
        let diff = Date.daysBetween(start: Date(), end: fleedClosedDate) // 365
            if diff >= 14 {
                
                print("Show alert")
            }
            
        
        

        return true
    }
    
    func triggerLocalNotification() {
        
        let fleedClosedDate = UserDefaults.standard.object(forKey: "sample_Application_Last_Opened") as! Date
        let diff = Date.daysBetween(start: Date(), end: fleedClosedDate)
               if diff >= 14 {
                   // 14 days and above trigger local notification
                   
            }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        UserDefaults.standard.set(Date(), forKey: "sample_Application_Last_Opened")


    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        UserDefaults.standard.set(Date(), forKey: "sample_Application_Last_Opened")

    }


}

extension Date {
    static func daysBetween(start: Date, end: Date) -> Int {
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: start)
        let date2 = calendar.startOfDay(for: end)
        
        let dat = calendar.dateComponents([.day], from: date1, to: date2)
        return dat.value(for: .day)!
    }
    
}
    

