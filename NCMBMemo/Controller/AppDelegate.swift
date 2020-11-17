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
        
        let applicationKey = "d8c923ffc5a052823c6c211a26b14b21abe8263f7151d2a95e24923eaab0a30d"
        let clientKey = "967bb4f6dfafe889e9d8811c5f072679a5915cc59b32c08e07eb2fb1767fbe9e"
        
        NCMB.setApplicationKey(applicationKey, clientKey: clientKey)
        
        return true
    }


    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }


}

