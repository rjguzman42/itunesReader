//
//  AppDelegate.swift
//  ItunesReader
//
//  Created by Roberto Guzman on 11/1/18.
//  Copyright © 2018 Fortytwo Sports. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        updateRootVC()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    
    //MARK: Authentication
    
    func updateRootVC() {
        if window == nil {
            let newWindow = UIWindow(frame: UIScreen.main.bounds)
            window = newWindow
        }
        
        //TabBar Controller
        let tabBarController = UITabBarController()
        let musicVC = MusicVC()
        musicVC.tabBarItem = UITabBarItem(title: Constants.Strings.musicTitle, image: nil, tag: 0)
        let moviesVC = MoviesVC()
        moviesVC.tabBarItem = UITabBarItem(title: Constants.Strings.moviesTitle, image: nil, tag: 1)
        tabBarController.viewControllers = [musicVC, moviesVC]
        
        //Navigation Controller
        let nvc = UINavigationController()
        nvc.navigationBar.prefersLargeTitles = true
        nvc.viewControllers = [tabBarController]
        window?.rootViewController = nvc
        window?.makeKeyAndVisible()
    }

}

