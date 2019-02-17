//
//  AppDelegate.swift
//  Takeaway
//
//  Created by BinaryBoy on 2/11/19.
//  Copyright © 2019 BinaryBoy. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        UINavigationBar.appearance().prefersLargeTitles = true

        let defaults = UserDefaults.standard
        if  defaults.bool(forKey: "openedBefore") == false {
            defaults.set(true, forKey: "openedBefore")
            LocalRestaurantRepository.setupDataBase()
        }
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = UINavigationController(rootViewController: RestaurantListBuilder.viewController(dataSource: LocalRestaurantRepository.self))
        self.window?.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }


}

