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
        
        let applicationKey = "badfd9dc994b2a9a4f37ce9ade6287a22789de30c7b3ec7b9a2a3bd914c7a8df"
        let clientKey = "e944922c0a35d7d34ce0679a058b133e3eedeb8d5b3d713fbd10d6d5e2309c89"
        
        NCMB.setApplicationKey(applicationKey, clientKey: clientKey)
        
        return true
    }


    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }


}

