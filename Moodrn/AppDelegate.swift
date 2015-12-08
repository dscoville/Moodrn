//
//  AppDelegate.swift
//  Moodrn
//
//  Created by David Scoville on 11/16/15.
//  Copyright © 2015 David Scoville. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Parse
import ParseFacebookUtilsV4

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var storyboard : UIStoryboard?;

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        Parse.setApplicationId("jhfxDUb6bVv70p0I22v5GBG3py7Xoxvxucf6NKzW", clientKey:"yzChRhrKqEkQ9NTsPYvJqx7C02PgDMP3yWNvCSj1")
        PFFacebookUtils.initializeFacebookWithApplicationLaunchOptions(launchOptions)
        
        self.storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle());
        var currentUser = PFUser.currentUser()
        if currentUser != nil {
            self.window?.rootViewController = self.storyboard?.instantiateViewControllerWithIdentifier("TimelineNavigationController");
        }
        
        return true
    }
    
    func application(application: UIApplication,
        openURL url: NSURL,
        sourceApplication: String?,
        annotation: AnyObject) -> Bool {
            return FBSDKApplicationDelegate.sharedInstance().application(application,
                openURL: url,
                sourceApplication: sourceApplication,
                annotation: annotation)
    }
    
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        // Store the deviceToken in the current Installation and save it to Parse
        let installation = PFInstallation.currentInstallation()
        installation.setDeviceTokenFromData(deviceToken)
        installation.saveInBackground()
        print("Did Register for Remote Notifications with Device Token")
    }
    
    func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
        PFPush.handlePush(userInfo)
        
       
        //self.pushViewController(ComposerViewController, animated: true)
        
        //if let targetView: String = userInfo["view"] as? String {
        //    // Show view controller from pay
        //    if PFUser.currentUser() != nil {
        //        let viewController = targetView
         //       self.navController.pushViewController(viewController, animated: true)
          //  }
        //}
    }
    
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification userInfo: [NSObject : AnyObject], withResponseInfo responseInfo: [NSObject : AnyObject], completionHandler: () -> Void) {
        
        let reply = responseInfo[UIUserNotificationActionResponseTypedTextKey]
        
        let message = PFObject(className: "Message")
        
        message["text"] = reply
        
        let userEmail = PFUser.currentUser()?.email
        message["username"] = userEmail
        message.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("they replied with \(reply)")
        }

        completionHandler()
    }
   
    //func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forRemoteNotification notification: UIUserNotificationType, withResponseInfo responseInfo: [NSObject : AnyObject?], completionHandler: () -> Void) {
        
     //   let reply = responseInfo[UIUserNotificationActionResponseTypedTextKey]
     //   print("they replied with \(reply)")
    
    //}

    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        FBSDKAppEvents.activateApp()
        let currentInstallation = PFInstallation.currentInstallation()
        if currentInstallation.badge != 0 {
            currentInstallation.badge = 0
            currentInstallation.saveEventually()
            print("Notification badge count cleared")
        }
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    


}

