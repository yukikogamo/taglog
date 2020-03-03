//
//  AppDelegate.swift
//  TAGLOG
//
//  Created by Yukiko Gamo on 2019/11/15.
//  Copyright © 2019 Yukiko Gamo. All rights reserved.
//

import UIKit
import NCMB

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let applicationKey = "aefce07503d4a8112453bd3dcce31d5721a428b75e0227edca47b62a4cc7d282"
        let clientKey = "7d382764ea6240ba11d133dc33cb9581765979a3643388a44b205ef1506c3e74"
        
        NCMB.setApplicationKey(applicationKey, clientKey: clientKey)
        
        return true
    }


    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }


}

