//
//  AppDelegate.swift
//  CleanComponentsExamples
//
//  Created by Andy Warwick on 03/04/2019.
//  Copyright © 2019 Andrew Warwick. All rights reserved.
//

import UIKit
import CleanComponents

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  // Instantiate a CleanFactory object that can create any type of Clean Swift Scene.
  private lazy var cleanFactory: CleanFactoryProtocol = CleanFactory()


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    self.window = UIWindow(frame: UIScreen.main.bounds)

    let initialScene: CleanSceneProtocol = cleanFactory.makeCleanScene(name: "ListOrders")

    self.window?.rootViewController = initialScene.viewController
    self.window?.makeKeyAndVisible()

    return true
  }


}


